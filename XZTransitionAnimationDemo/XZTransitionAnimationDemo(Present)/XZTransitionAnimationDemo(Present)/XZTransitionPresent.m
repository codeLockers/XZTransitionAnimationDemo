//
//  XZTransitionPresent.m
//  XZTransitionAnimationDemo(Present)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTransitionPresent.h"
#import "XZSecondViewController.h"
#import "ViewController.h"

@implementation XZTransitionPresent

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{

    ViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    XZSecondViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *snapShot = [fromVc.imageBtn snapshotViewAfterScreenUpdates:YES];
    
    snapShot.frame = [containerView convertRect:fromVc.imageBtn.frame fromView:fromVc.view];
    
    fromVc.imageBtn.hidden= YES;
    
    toVc.view.frame = [transitionContext finalFrameForViewController:toVc];
    toVc.view.alpha = 0.0f;
    toVc.centerView.hidden = YES;
    
    [containerView addSubview:toVc.view];
    [containerView addSubview:snapShot];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        toVc.view.alpha = 1.0f;
        
        CGRect rect = [containerView convertRect:toVc.centerView.frame fromView:toVc.view];
        
        snapShot.frame = rect;
        
    } completion:^(BOOL finished) {
        
        toVc.centerView.hidden = NO;
        fromVc.imageBtn.hidden = NO;
        
        [snapShot removeFromSuperview];
        
        [transitionContext completeTransition:YES];
        
    }];
}

@end
