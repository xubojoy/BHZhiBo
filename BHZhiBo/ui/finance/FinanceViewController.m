//
//  FinanceViewController.m
//  BHZhiBo
//
//  Created by xubojoy on 2016/12/21.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "FinanceViewController.h"

@interface FinanceViewController ()

@end

@implementation FinanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initHeadView];
}
//初始化自定义导航
-(void)initHeadView{
    self.headerView = [[HeaderView alloc] initWithTitle:@"财经" navigationController:self.navigationController];
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
