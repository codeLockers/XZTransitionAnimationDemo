//
//  XZTransition1Push.m
//  XZTransitonAnimationDemo(Naivgation)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTransition1Push.h"

@implementation XZTransition1Push

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{

    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
 
    _transitionContext = transitionContext;
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromVc.view];
    [containerView addSubview:toVc.view];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1/500.0;
    toVc.view.layer.transform = transform;
    toVc.view.layer.anchorPoint = CGPointMake(1, 0.5);
    toVc.view.layer.position = CGPointMake(CGRectGetMaxX(fromVc.view.frame), CGRectGetMidY(toVc.view.frame));
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.duration = [self transitionDuration:transitionContext];
    animation.fromValue = @(M_PI_2);
    animation.toValue = @(0);
    animation.delegate = self;
    [toVc.view.layer addAnimation:animation forKey:@"rotateAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [_transitionContext finishInteractiveTransition];
        [_transitionContext completeTransition:YES];
    }
}

@end
