//
//  IndexViewController.m
//  BHZhiBo
//
//  Created by xubojoy on 2016/12/21.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [ColorUtils colorWithHexString:common_bg_color];
    [self initHeadView];
    self.imageArray = [NSMutableArray arrayWithObjects:@"12.jpg",@"13.jpg",@"14.jpg",@"15.jpg", nil];
    [self initPageScrollView];
    [self initCategoryView];
    
}

//初始化自定义导航
-(void)initHeadView{
//    self.headerView = [[HeaderView alloc] initWithTitle:@"首页" navigationController:self.navigationController];
//    self.headerView.backBut.hidden = YES;
//    self.headerView.userInteractionEnabled = YES;
//    [self.view addSubview:self.headerView];
    
    UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 20)];
    statusView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:statusView];
}

- (void)initPageScrollView{
    float height = screen_width/2;
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 20, screen_width, height) imageNamesGroup:self.imageArray];
    self.cycleScrollView.delegate = self;
    self.cycleScrollView.autoScrollTimeInterval = 2.0;
    [self.view addSubview:self.cycleScrollView];
}

- (void)initCategoryView{
    self.customCategoryView = [[CustomCategoryView alloc] initWithFrame:CGRectMake(0, self.cycleScrollView.frame.origin.y+self.cycleScrollView.frame.size.height+general_padding, screen_width, 140)];
    self.customCategoryView.backgroundColor = [ColorUtils colorWithHexString:common_bg_color];
    self.customCategoryView.delegate = self;
    [self.view addSubview:self.customCategoryView];
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@">>>>>>>>>>>>>>点击了第%d",(int)index);
}

- (void)didSelectedCustomCategoryViewItem:(NSInteger)item{

    NSLog(@">>>>>>>>>itemitemitem>>>>>点击了第%d",(int)item);
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
