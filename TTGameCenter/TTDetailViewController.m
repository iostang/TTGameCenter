//
//  TTDetailViewController.m
//  TTGameCenter
//
//  Created by TonyTong on 15/3/9.
//  Copyright (c) 2015年 TonyTong. All rights reserved.
//

#import "TTDetailViewController.h"

@interface TTDetailViewController ()

@end

@implementation TTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:0.254 green:0.651 blue:1.000 alpha:1.000];
    button.frame = CGRectMake(20, 20, 100, 40);
    [button addTarget:self action:@selector(buttonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}
- (void)buttonDidClick
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    [self.delegate buttonDidClickForTypeWithDismiss];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
