
//
//  Untitled.swift
//  CustomPresentation
//
//  Created by Sergey Kozlov on 18.12.2024.
//

import UIKit

class PresentAnimation: NSObject {
    let duration: TimeInterval = 1
    let animationType: PresentAnimationTypes = .rollFromLeft
    
    private func animator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        
        let to = transitionContext.view(forKey: .to)!
        let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
        let startTransform = animationType.startState(finalFrame: finalFrame)
        to.transform = .identity.rotated(by: startTransform.rotation)
        to.frame = finalFrame.offsetBy(dx: startTransform.offset.x, dy: startTransform.offset.y)
        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
            to.frame = finalFrame
            to.transform = .identity
        }
        animator.addCompletion { (position) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        return animator
    }
}



extension PresentAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let animator = self.animator(using: transitionContext)
        animator.startAnimation()
    }
    
    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        return self.animator(using: transitionContext)
    }
}

