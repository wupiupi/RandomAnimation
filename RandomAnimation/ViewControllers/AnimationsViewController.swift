//
//  AnimationsViewController.swift
//  RandomAnimation
//
//  Created by Paul Makey on 25.01.24.
//

import UIKit
import SpringAnimation

final class AnimationsViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var animateButton: UIButton!

    // MARK: - Private Properties
    private let animations = Animation.getAnimations()
    private var currentAnimation: Animation!
    private var nextAnimation: Animation!
    
    private var shouldChangeButtonTitle = false

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        springAnimationView.layer.cornerRadius = 22
        getNextAnimation()
    }

    // MARK: - IB Actions
    @IBAction func animateButtonDidTapped() {
        guard let currentAnimation else { return }
                
        animateSpringView(with: currentAnimation)
        updateUI(with: currentAnimation)
        
        getNextAnimation()
    }
}

// MARK: - Private Methods
private extension AnimationsViewController {
    func updateUI(with animation: Animation) {
        presetLabel.text = animation.animation
        curveLabel.text = animation.curve
        forceLabel.text = animation.force.string()
        durationLabel.text = animation.duration.string()
        delayLabel.text = animation.delay.string()
    }
    
    func animateSpringView(with animation: Animation) {
        springAnimationView.animation = currentAnimation.animation
        springAnimationView.curve = currentAnimation.curve
        springAnimationView.force = currentAnimation.force
        springAnimationView.duration = currentAnimation.duration
        springAnimationView.delay = currentAnimation.delay
        
        springAnimationView.animate()
    }
    
    func getNextAnimation() {
        nextAnimation = animations.randomElement()
        
        if shouldChangeButtonTitle {
            animateButton.setTitle("Continue with: \(nextAnimation.animation)", for: .normal)
        } else {
            shouldChangeButtonTitle = true
            updateUI(with: nextAnimation)
        }
        
        currentAnimation = nextAnimation
    }
}

// MARK: - String
private extension Double {
    func string() -> String {
        String(format: "%.2f", self)
    }
}

