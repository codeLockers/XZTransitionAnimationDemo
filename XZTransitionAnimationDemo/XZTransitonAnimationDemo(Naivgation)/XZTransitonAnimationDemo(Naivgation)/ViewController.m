//
//  ViewController.m
//  XZTransitonAnimationDemo(Naivgation)
//
//  Created by 徐章 on 16/5/29.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "ViewController.h"
#import "XZTransition1FirstViewController.h"
#import "XZTransition2FirstViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Transition%ld",indexPath.row+1];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            XZTransition1FirstViewController *transition1FirstVc = [[XZTransition1FirstViewController alloc] init];
            [self.navigationController pushViewController:transition1FirstVc animated:YES];
        }
            break;
        case 1:
        {
            XZTransition2FirstViewController *transition2FirstVc = [[XZTransition2FirstViewController alloc] init];
            [self.navigationController pushViewController:transition2FirstVc animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
