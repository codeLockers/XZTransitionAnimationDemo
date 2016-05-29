//
//  ViewController.m
//  XZTransitionAnimationDemo(Present)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "ViewController.h"
#import "XZSecondViewController.h"
#import "XZTransitionPresent.h"
#import "XZTransitionDismiss.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height - 70, 50, 50)];
    self.imageBtn.backgroundColor = [UIColor redColor];
    self.imageBtn.layer.cornerRadius = 25.0f;
    self.imageBtn.layer.masksToBounds = YES;
    [self.imageBtn addTarget:self action:@selector(imageBtn_Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.imageBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imageBtn_Pressed{
    
    XZSecondViewController *secondVc = [[XZSecondViewController alloc] init];
    secondVc.transitioningDelegate= self;
    [self presentViewController:secondVc animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[XZTransitionPresent alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[XZTransitionDismiss alloc] init];
}

@end
