//
//  XZTransition.m
//  XZTransitionAnimationDemo(TabBar)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTransition.h"

@implementation XZTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromVc.view];
    [containerView addSubview:toVc.view];
    
    toVc.view.frame = CGRectMake(40, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        toVc.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
    }];
}



@end
