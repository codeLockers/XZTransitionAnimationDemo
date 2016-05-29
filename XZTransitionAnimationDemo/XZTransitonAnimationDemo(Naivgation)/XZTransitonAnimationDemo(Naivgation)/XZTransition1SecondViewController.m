//
//  XZTransition1SecondViewController.m
//  XZTransitonAnimationDemo(Naivgation)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTransition1SecondViewController.h"
#import "XZTransition1Pop.h"

@interface XZTransition1SecondViewController ()<UINavigationControllerDelegate>{

    UIScreenEdgePanGestureRecognizer *_pan;
    UIPercentDrivenInteractiveTransition *_interaction;
}

@end

@implementation XZTransition1SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.backgroundColor = [UIColor greenColor];
    view.center = self.view.center;
    [self.view addSubview:view];

    _pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleEgdeScreenPanGesture:)];
    _pan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:_pan];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleEgdeScreenPanGesture:(UIScreenEdgePanGestureRecognizer *)panGesture{

    CGFloat progress = ([panGesture translationInView:self.view]).x / [UIScreen mainScreen].bounds.size.width;
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            _interaction = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case UIGestureRecognizerStateChanged:
            [_interaction updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            [_interaction finishInteractiveTransition];
            break;
        default:
            break;
    }

}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{

    if (operation == UINavigationControllerOperationPop) {
        
        return [[XZTransition1Pop alloc] init];
    }
    return nil;
}
   
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    return _interaction ;
}


@end
