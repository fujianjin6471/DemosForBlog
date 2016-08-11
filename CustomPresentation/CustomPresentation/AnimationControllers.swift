//
//  AnimationControllers.swift
//  CustomPresentation
//
//  Created by 付剑津 on 8/11/16.
//  Copyright © 2016 fujianjin6471. All rights reserved.
//

import UIKit

class PresentationAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let toView = toVC?.view
        let containerView = transitionContext.containerView()
        
        containerView!.addSubview(toView!)
        
        let finalFrame = transitionContext.finalFrameForViewController(toVC!)
        var initialFrame = finalFrame
        initialFrame.origin.x = containerView!.frame.width
        
        toView?.frame = initialFrame
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            toView?.frame = finalFrame
            }, completion: { finished in
                transitionContext.completeTransition(true)
        })
    }
}

class DismissalAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let fromView = fromVC?.view
        let containerView = transitionContext.containerView()
        
        let initialFrame = transitionContext.initialFrameForViewController(fromVC!)
        var finalFrame = initialFrame
        finalFrame.origin.x = containerView!.frame.width
        
        fromView?.frame = initialFrame
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            fromView?.frame = finalFrame
            }, completion: { finished in
                fromView?.removeFromSuperview()
                transitionContext.completeTransition(true)
        })
    }
}