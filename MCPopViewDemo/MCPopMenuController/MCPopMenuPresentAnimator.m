//
//  MCPopMenuPresentAnimator.m
//  qikeyun
//
//  Created by 马超 on 16/3/29.
//  Copyright © 2016年 Jerome. All rights reserved.
//

#import "MCPopMenuPresentAnimator.h"

@implementation MCPopMenuPresentAnimator
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
    UIView *dimmingView = [[UIView alloc] initWithFrame:fromView.bounds];
    dimmingView.backgroundColor = [UIColor blackColor];
    dimmingView.layer.opacity = 0.5;
    fromView.userInteractionEnabled = YES;
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.userInteractionEnabled = YES;
  
    
    //    toView.frame = CGRectMake(0,
    //                              0,
    //                              100,
    //                              100);
    //    toView.center = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
    
    [transitionContext.containerView addSubview:dimmingView];
    [transitionContext.containerView addSubview:toView];
    
   
}

@end
