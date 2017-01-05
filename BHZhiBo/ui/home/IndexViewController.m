//
//  IndexViewController.m
//  BHZhiBo
//
//  Created by xubojoy on 2016/12/21.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "IndexViewController.h"
#import "CustomCategoryCollectionViewCell.h"
#import "AoiroSoraLayout.h"
#import "CommonWebViewController.h"
#import "JSONModel.h"
#import "BIDObjectToNsDictionary.h"
#import "BHZhiBoTabbar.h"
//#import <ShareSDKConnector/ShareSDKConnector.h>
#define COLLECTVIEW_HEIGHT (screen_height-tabbar_height-140-20-10-screen_width/2);
@interface IndexViewController ()<AoiroSoraLayoutDelegate>

@end
static NSString *customCategoryCollectionViewCellId = @"CustomCategoryCollectionViewCell";
@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.autoresizesSubviews = NO;
//    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [ColorUtils colorWithHexString:common_bg_color];
    [self initHeadView];
    self.imageArray = [NSMutableArray arrayWithObjects:@"12.jpg",@"13.jpg",@"14.jpg",@"15.jpg", nil];
    [self initMainScrollVew];
    [self initPageScrollView];
    [self initCategoryView];
    [self initCollectView];
}

//初始化自定义导航
-(void)initHeadView{
    self.headerView = [[HeaderView alloc] initWithTitle:@"中江微盘直播" navigationController:self.navigationController];
    self.headerView.backBut.hidden = YES;
    self.headerView.userInteractionEnabled = YES;
    [self.view addSubview:self.headerView];
    
//    UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 20)];
//    statusView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:statusView];
}

//初始化scrollview容器
-(void)initMainScrollVew{
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.headerView.frame.size.height, screen_width, screen_height-self.headerView.frame.size.height-tabbar_height)];
    self.mainScrollView.backgroundColor = [ColorUtils colorWithHexString:common_bg_color];
    self.mainScrollView.showsVerticalScrollIndicator = NO;
    self.mainScrollView.userInteractionEnabled = YES;
    [self.view addSubview:self.mainScrollView];
}


- (void)initPageScrollView{
    float height = screen_width/3;
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screen_width, height) imageNamesGroup:self.imageArray];
    self.cycleScrollView.delegate = self;
    self.cycleScrollView.autoScrollTimeInterval = 2.0;
    [self.mainScrollView addSubview:self.cycleScrollView];
}

- (void)initCategoryView{
    float height = 0.0;
    if (screen_height >= 568) {
        height = 160;
    }else{
        height = 140;
    }
    self.customCategoryView = [[CustomCategoryView alloc] initWithFrame:CGRectMake(0, screen_width/3+general_padding, screen_width, height)];
    self.customCategoryView.backgroundColor = [ColorUtils colorWithHexString:common_bg_color];
    self.customCategoryView.delegate = self;
    [self.mainScrollView addSubview:self.customCategoryView];
}

- (void)initCollectView{
    AoiroSoraLayout * layout = [[AoiroSoraLayout alloc]init];
    layout.interSpace = 5; // 每个item 的间隔
    layout.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.colNum = 2; // 列数;
    layout.delegate = self;
//    screen_height-tabbar_height-140-20-10-
    float H = screen_width/2;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,self.customCategoryView.frame.size.height+screen_width/3+general_padding, screen_width, H) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.scrollEnabled = NO;
    
    self.collectionView.backgroundColor = [ColorUtils colorWithHexString:common_bg_color];
    
    UINib *nib = [UINib nibWithNibName:@"CustomCategoryCollectionViewCell" bundle: nil];
    [self.collectionView registerNib:nib
                            forCellWithReuseIdentifier:customCategoryCollectionViewCellId];
    
    [self.mainScrollView addSubview:self.collectionView];
    float scrollewH = screen_width/3+general_padding+H+self.customCategoryView.frame.size.height;
    self.mainScrollView.contentSize = CGSizeMake(screen_width, scrollewH);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:customCategoryCollectionViewCellId forIndexPath:indexPath];
    cell.contentView.backgroundColor = [ColorUtils randomColor];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    screen_height-tabbar_height-140-20-10-
    float H = screen_width/2;
    if (indexPath.item == 0) {
        return CGSizeMake(screen_width/2,H);
    }else{
        return CGSizeMake(screen_width/2,H/2);
    }
}

#pragma mark -- 返回每个item的高度
- (CGFloat)itemHeightLayOut:(AoiroSoraLayout *)layOut indexPath:(NSIndexPath *)indexPath
{
//    screen_height-tabbar_height-140-20-10-
    float H = screen_width/2;
    if (indexPath.item == 0) {
        return H;
    }else{
        return H/2;
    }
}

#pragma mark -- 选中某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"第 %ld 个cell",(long)indexPath.row);
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@">>>>>>>>>>>>>>点击了第%d",(int)index);
}

- (void)didSelectedCustomCategoryViewItem:(NSInteger)item{

    NSLog(@">>>>>>>>>itemitemitem>>>>>点击了第%d",(int)item);
    if (item == 0) {
        BHZhiBoTabbar *tabBar = [(AppDelegate*)[UIApplication sharedApplication].delegate tabbar];
        [tabBar.tabBarController setSelectedIndex:1];
        
    }else if (item == 1) {
        BHZhiBoTabbar *tabBar = [(AppDelegate*)[UIApplication sharedApplication].delegate tabbar];
        [tabBar.tabBarController setSelectedIndex:2];

    }else if (item == 4) {
        BHZhiBoTabbar *tabBar = [(AppDelegate*)[UIApplication sharedApplication].delegate tabbar];
        [tabBar.tabBarController setSelectedIndex:3];

    }else if (item == 5){
        CommonWebViewController *cwvc = [[CommonWebViewController alloc] initWithUrl:@"http://192.168.1.128:8080/site/userInfo" title:@"注册"];
        [self.navigationController pushViewController:cwvc animated:YES];
    }
    else if (item == 0){
        NSURL * myURL_APP_A = [NSURL URLWithString:@"test://"];
        if ([[UIApplication sharedApplication] canOpenURL:myURL_APP_A]) {
            NSLog(@"canOpenURL");
            [[UIApplication sharedApplication] openURL:myURL_APP_A];
        }else{
            NSLog(@"canOpenURL--------------");
            NSURL * zhongjiangUrl = [NSURL URLWithString:zhongjiang_weipan_app_url];
            [[UIApplication sharedApplication] openURL:zhongjiangUrl];
        }
    }
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
