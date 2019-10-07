//
//  ZoomInTransitionDelegate.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 10/5/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation
import UIKit

protocol ZoomingViewController{
    func ZoomingImageView(for transition:ZoomInTransitonDelegate)-> UIImageView?
    
}
enum TransitionState{
    case initialState
    case finalState
}
class ZoomInTransitonDelegate:NSObject{
    let transitionDuration = 0.5
    var operation:UINavigationController.Operation = .none
    private let zoomScale = CGFloat(15)
    private let backgroundScale = CGFloat(0.7)
    
    typealias ZoomingViews = (otherView:UIView, imageView:UIView)
    func configureViews(for state:TransitionState, containerView: UIView, backgroundVC:UIViewController,viewInBackGround:ZoomingViews, viewsInForeGround:ZoomingViews, snapshotView:ZoomingViews){
        switch state{
        case .initialState:
            backgroundVC.view.transform = CGAffineTransform.identity
            backgroundVC.view.alpha = 1
            
            snapshotView.imageView.frame = containerView.convert(viewInBackGround.imageView.frame, from: viewInBackGround.imageView.superview)
        case .finalState:
             backgroundVC.view.transform = CGAffineTransform(scaleX: backgroundScale, y: backgroundScale)
            backgroundVC.view.alpha = 1
            
            snapshotView.imageView.frame = containerView.convert(viewsInForeGround.imageView.frame, from: viewsInForeGround.imageView.superview)
        }
    }
}

extension ZoomInTransitonDelegate: UIViewControllerAnimatedTransitioning{
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: transitionContext)
        let fromViewController = transitionContext.viewController(forKey: .from)!
        let toViewController = transitionContext.viewController(forKey: .to)!
        let containerView = transitionContext.containerView
        
        var backgroundVC = fromViewController
        var foreGroundVC = toViewController
        
        if operation == .pop{
            backgroundVC = toViewController
            foreGroundVC = fromViewController
        }
        let backgroundImageView = (backgroundVC as? ZoomingViewController)?.ZoomingImageView(for: self)
        
        let forgroundImageView = (foreGroundVC as? ZoomingViewController)?.ZoomingImageView(for: self)
        
        assert(backgroundImageView != nil, "Cannot find image")
         assert(forgroundImageView != nil, "Cannot find image")
        
        let newBackgroundImageView = backgroundImageView
        let newforgroundImageView = forgroundImageView
        
        let imageViewSnapshot = UIImageView(image: backgroundImageView?.image)
        imageViewSnapshot.contentMode = .scaleAspectFill
        imageViewSnapshot.layer.masksToBounds = true
        
        newBackgroundImageView?.isHidden = true
        newforgroundImageView?.isHidden = true
        let foregroundViewBackgroundColor = foreGroundVC.view.backgroundColor
        foreGroundVC.view.backgroundColor = .clear
        containerView.backgroundColor = .white
        
        containerView.addSubview(backgroundVC.view)
        containerView.addSubview(foreGroundVC.view)
        containerView.addSubview(imageViewSnapshot)
        
        var preTransitionState = TransitionState.initialState
        var postTransitionState = TransitionState.finalState
        
        if operation == .pop{
            preTransitionState = .finalState
            postTransitionState = .initialState
        }
        
        configureViews(for: preTransitionState, containerView: containerView, backgroundVC: backgroundVC, viewInBackGround: (newBackgroundImageView!,newBackgroundImageView!), viewsInForeGround: (newforgroundImageView!,newforgroundImageView!), snapshotView: (imageViewSnapshot,imageViewSnapshot))
        
        foreGroundVC.view.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [], animations: {
            
            self.configureViews(for: postTransitionState, containerView: containerView, backgroundVC: backgroundVC, viewInBackGround: (newBackgroundImageView!,newBackgroundImageView!), viewsInForeGround: (newforgroundImageView!,newforgroundImageView!), snapshotView: (imageViewSnapshot,imageViewSnapshot))
            
        }) { (finished) in
            backgroundVC.view.transform = CGAffineTransform.identity
            imageViewSnapshot.removeFromSuperview()
            newBackgroundImageView?.isHidden = false
            newforgroundImageView?.isHidden = false
            foreGroundVC.view.backgroundColor = foregroundViewBackgroundColor
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    
}

extension ZoomInTransitonDelegate: UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if fromVC is ZoomingViewController && toVC is ZoomingViewController{
            self.operation = operation
            return self
        } else {
            return nil
        }
    }
}
