//
//  ViewController.swift
//  Spring Animation App
//
//  Created by Igor on 21.09.2021.
//

import Spring

class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var animatedView: SpringView!
    @IBOutlet var animationInfoLabel: UILabel! {
        didSet {
            animationInfoLabel.textColor = .white
        }
    }

    @IBOutlet var runAnimateButton: SpringButton!
    
    // MARK: - Private properties

    private var animations = Animation.getAnimations()
    private var animationCount = 0
    
    // MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAnimationsSet()
    }

    // MARK: - IBActions

    @IBAction func runAnimateButtonPressed() {
        animateButton()
        animateView()
    }
    
    // MARK: - Private methods
    private func animateView() {
        let currentAnimation = animations[animationCount]
        
        animatedView.animation = currentAnimation.animation
        animatedView.duration = currentAnimation.duration
        animatedView.curve = currentAnimation.curve
        animatedView.force = currentAnimation.force
        animatedView.delay = currentAnimation.delay

        animatedView.animate()
        
        guard animations.count - 1 != animationCount else {
            setUpAnimationsSet()
            return
        }
        animationCount += 1
        setAnimationInfo(animation: animations[animationCount])
        
        guard animations[animationCount].animation != animations.last?.animation else {
            setButtonInfo(title: "Restart \(animations.first?.animation ?? "")")
            return
        }
        setButtonInfo(title: "Next \(animations[animationCount + 1].animation)")
    }
    
    private func animateButton() {
        runAnimateButton.animation = "fadeIn"
        runAnimateButton.curve = "spring"
        runAnimateButton.duration = 1.0
        
        runAnimateButton.animate()
    }
    
    private func setUpAnimationsSet() {
        animationCount = 0
        
        setAnimationInfo(animation: animations[animationCount])
        setButtonInfo(title: "Next \(animations[animationCount + 1].animation)")
    }
    
    private func setAnimationInfo(animation: Animation) {
        animationInfoLabel.text = """
        Animation: \(animation.animation)
        Duration: \(animation.duration)
        Curve: \(animation.curve)
        Force: \(animation.force)
        Delay: \(animation.delay)
        """
    }
    
    private func setButtonInfo(title: String) {
        runAnimateButton.setTitle(title, for: .normal)
    }
}
