//
//  TransactionViewController.m
//  BHZhiBo
//
//  Created by xubojoy on 2016/12/21.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "TransactionViewController.h"

@interface TransactionViewController ()

@end

@implementation TransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.autoresizesSubviews = NO;
    [self initHeadView];
}

-(void)initHeadView{
    self.headerView = [[HeaderView alloc] initWithTitle:@"交易" navigationController:self.navigationController];
    self.headerView.backBut.hidden = YES;
    self.headerView.userInteractionEnabled = YES;
    [self.view addSubview:self.headerView];
    
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
