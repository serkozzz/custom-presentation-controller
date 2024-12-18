//
//  DismissAnimation 2.swift
//  CustomPresentation
//
//  Created by Sergey Kozlov on 18.12.2024.
//

import UIKit

class DismissAnimation: NSObject {
    let duration: TimeInterval = 1
    let animationType: DismissAnimationTypes = .toRight
    
    

    private func animator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        let from = transitionContext.view(forKey: .from)!
        let initialFrame = transitionContext.initialFrame(for: transitionContext.viewController(forKey: .from)!)
        
        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
            
            let endTransform = self.animationType.finalState(finalFrame: initialFrame)

            
            from.frame = initialFrame.offsetBy(dx: endTransform.offset.x, dy: endTransform.offset.y)

        }

        animator.addCompletion { (position) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

        return animator
    }
}

extension DismissAnimation: UIViewControllerAnimatedTransitioning {
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
