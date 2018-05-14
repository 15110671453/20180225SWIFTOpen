//
//  SlideAnimator.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class SlideAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    //MARK: 实现代理UIViewControllerAnimatedTransitioning 必须的方法
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
    
        let transformedStartFrame = toVC?.view.frame
        
        let origin = transformedStartFrame?.origin
        
        let width = transformedStartFrame?.width
        
        let height = transformedStartFrame?.height
        
        let x = (origin?.x)! - width!
        let y = origin?.y
        
        let transformedEndFrame = CGRect(x:x,y:y!,width:width!,height:height!)
        
        
        
        transitionContext.containerView.addSubview((fromVC?.view)!)
        
        transitionContext.containerView.addSubview((toVC?.view)!)
        
        
        
        UIView.animate(withDuration: 1.1, animations: {
            
            toVC?.view.frame =  transformedEndFrame
            toVC?.view.alpha = 0.5
            
        }) { (finished) in
            
            
            toVC?.view.frame = transformedStartFrame!
            toVC?.view.alpha = 1.0
            
            transitionContext.completeTransition(true)
            
        }
        
        
    }
    
    
    
    

}
