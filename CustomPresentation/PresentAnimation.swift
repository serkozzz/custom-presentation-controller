
//
//  Untitled.swift
//  CustomPresentation
//
//  Created by Sergey Kozlov on 18.12.2024.
//

import UIKit

class PresentAnimation: NSObject {
    let duration: TimeInterval = 1
    let animationType: AnimationTypes = .rollFromBottom
    
        private func animator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {

            let to = transitionContext.view(forKey: .to)!
            let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
            to.transform  = animationType.startState(finalFrame: finalFrame)
            
            //to.frame = finalFrame.offsetBy(dx: -finalFrame.width, dy: 0)
            //to.transform = .identity.translatedBy(x: -finalFrame.width, y: <#T##CGFloat#>).rotated(by: CGFloat.pi)
            let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
                //to.frame = finalFrame
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

