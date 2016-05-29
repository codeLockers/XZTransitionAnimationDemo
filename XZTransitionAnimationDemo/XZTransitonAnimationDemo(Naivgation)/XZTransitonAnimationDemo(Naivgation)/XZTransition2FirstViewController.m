//
//  XZTransition2FirstViewController.m
//  XZTransitonAnimationDemo(Naivgation)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTransition2FirstViewController.h"
#import "XZTranstion2SecondViewController.h"
#import "XZTransition2Push.h"

@interface XZTransition2FirstViewController ()<UINavigationControllerDelegate>

@end

@implementation XZTransition2FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Transition2";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    pushBtn.center = self.view.center;
    pushBtn.backgroundColor = [UIColor blueColor];
    [pushBtn setTitle:@"PUSH" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushBtn_Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear: animated];
    self.navigationController.delegate = self;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushBtn_Pressed{
    
    XZTranstion2SecondViewController *transition2SecondVc = [[XZTranstion2SecondViewController alloc] init];
    [self.navigationController pushViewController:transition2SecondVc animated:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        
        return [[XZTransition2Push alloc] init];
    }
    return nil;
}


@end
