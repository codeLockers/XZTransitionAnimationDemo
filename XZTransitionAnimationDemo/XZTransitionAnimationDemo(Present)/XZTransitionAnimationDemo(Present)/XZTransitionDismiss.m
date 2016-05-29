//
//  XZTransitionDismiss.m
//  XZTransitionAnimationDemo(Present)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTransitionDismiss.h"
#import "XZSecondViewController.h"
#import "ViewController.h"

@implementation XZTransitionDismiss

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    XZSecondViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    ViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *snapShot = [fromVc.centerView snapshotViewAfterScreenUpdates:YES];
    
    snapShot.frame = [containerView convertRect:fromVc.centerView.frame fromView:fromVc.view];
    
    fromVc.centerView.hidden= YES;
    
    toVc.view.frame = [transitionContext finalFrameForViewController:toVc];

    toVc.imageBtn.hidden = YES;
    
    [containerView addSubview:toVc.view];
    [containerView addSubview:fromVc.view];
    [containerView addSubview:snapShot];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{

        fromVc.view.alpha = 0.0f;
        
        CGRect rect = [containerView convertRect:toVc.imageBtn.frame fromView:toVc.view];
        
        snapShot.frame = rect;
        
    } completion:^(BOOL finished) {
        
        toVc.imageBtn.hidden = NO;
        fromVc.centerView.hidden = NO;
        
        [snapShot removeFromSuperview];
        
        [transitionContext completeTransition:YES];
        
    }];
}


@end
