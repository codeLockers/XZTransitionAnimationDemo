//
//  XZTranstion2SecondViewController.m
//  XZTransitonAnimationDemo(Naivgation)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTranstion2SecondViewController.h"
#import "XZTransition2Pop.h"

@interface XZTranstion2SecondViewController ()<UINavigationControllerDelegate>
{
    
    UIPercentDrivenInteractiveTransition *_interaction;
    UIView *_panView;
}

@end

@implementation XZTranstion2SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *popBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    popBtn.center = self.view.center;
    popBtn.backgroundColor = [UIColor blueColor];
    [popBtn setTitle:@"POP" forState:UIControlStateNormal];
    [popBtn addTarget:self action:@selector(popBtn_Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popBtn];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    _panView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50.0f)];
    _panView.backgroundColor = [UIColor greenColor];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [_panView addGestureRecognizer:panGesture];
    
    [self.view addSubview:_panView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear: animated];
    self.navigationController.delegate = self;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture{

    CGFloat progress = ([panGesture translationInView:_panView]).y / [UIScreen mainScreen].bounds.size.height;
    
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


- (void)popBtn_Pressed{

    [self.navigationController popViewControllerAnimated:YES];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    return _interaction ;
}


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPop) {
        
        return [[XZTransition2Pop alloc] init];
    }
    return nil;
}

@end
