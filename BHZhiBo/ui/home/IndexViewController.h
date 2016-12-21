//
//  IndexViewController.h
//  BHZhiBo
//
//  Created by xubojoy on 2016/12/21.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "CustomCategoryView.h"
@interface IndexViewController : BaseViewController<SDCycleScrollViewDelegate,CustomCategoryViewDelegate>
@property (nonatomic, strong) HeaderView *headerView;
@property (nonatomic ,strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic ,strong) NSMutableArray *imageArray;
@property (nonatomic ,strong) CustomCategoryView *customCategoryView;
@end
