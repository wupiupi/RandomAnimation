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
    
    // MARK: - Private Properties
    let animations = Animation.getAnimations()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - IB Actions
    @IBAction func animateButtonDidTapped(_ sender: UIButton) {
        guard let animation = animations.randomElement() else {
            return
        }
        
        updateUI(with: animation)
        sender.setTitle("Continue with: \(animation.preset)", for: .normal)
    }
    
}

private extension AnimationsViewController {
    func updateUI(with animation: Animation) {
        
        presetLabel.text = animation.preset
        curveLabel.text = animation.curve
        forceLabel.text = animation.force.string()
        durationLabel.text = animation.duration.string()
        delayLabel.text = animation.delay.string()
        
        springAnimationView.animation = animation.preset
        springAnimationView.animate()
    }
}

extension Double {
    func string() -> String {
        String(format: "%.2f", self)
    }
}
