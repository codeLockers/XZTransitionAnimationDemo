//
//  XZTransition2Pop.m
//  XZTransitonAnimationDemo(Naivgation)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTransition2Pop.h"

@implementation XZTransition2Pop

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVc.view];
    [containerView addSubview:fromVc.view];
   

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromVc.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
    }];
    
}

@end
