//
//  XZSecondViewController.m
//  XZTransitionAnimationDemo(Present)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZSecondViewController.h"
#import "XZTransitionPresent.h"

@interface XZSecondViewController ()

@end

@implementation XZSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.centerView.backgroundColor = [UIColor redColor];
    self.centerView.layer.cornerRadius = 100.0f;
    self.centerView.layer.masksToBounds = YES;
    self.centerView.center = self.view.center;
    [self.view addSubview:self.centerView];
    
    UIButton *dismissBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height - 70, [UIScreen mainScreen].bounds.size.width - 40, 50.0f)];
    dismissBtn.backgroundColor = [UIColor blueColor];
    [dismissBtn addTarget:self action:@selector(dismissBtn_Pressed) forControlEvents:UIControlEventTouchUpInside];
    [dismissBtn setTitle:@"DISMISS" forState:UIControlStateNormal];
    [self.view addSubview:dismissBtn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissBtn_Pressed{

    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
