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
        getNextAnimation()
    }

    // MARK: - IB Actions
    @IBAction func animateButtonDidTapped() {
        guard let currentAnimation else { return }
        
        updateUI(with: currentAnimation)
        
        springAnimationView.animation = currentAnimation.animation
        springAnimationView.animate()
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

