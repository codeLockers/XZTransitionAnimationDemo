//
//  XZTransition1Pop.m
//  XZTransitonAnimationDemo(Naivgation)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTransition1Pop.h"

@implementation XZTransition1Pop

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    _transitionContext = transitionContext;
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVc.view];
    [containerView addSubview:fromVc.view];
    
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1/500.0;
    fromVc.view.layer.transform = transform;
    fromVc.view.layer.anchorPoint = CGPointMake(1, 0.5);
    fromVc.view.layer.position = CGPointMake(CGRectGetMaxX(toVc.view.frame), CGRectGetMidY(fromVc.view.frame));
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.duration = [self transitionDuration:transitionContext];
    animation.fromValue = @(0);
    animation.toValue = @(M_PI_2);
    animation.delegate = self;
    [fromVc.view.layer addAnimation:animation forKey:@"rotateAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [_transitionContext finishInteractiveTransition];
        [_transitionContext completeTransition:YES];
    }
}

@end
