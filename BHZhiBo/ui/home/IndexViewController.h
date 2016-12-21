//
//  IndexViewController.h
//  BHZhiBo
//
//  Created by xubojoy on 2016/12/21.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
@interface IndexViewController : BaseViewController<SDCycleScrollViewDelegate>
@property (nonatomic, strong) HeaderView *headerView;
@property (nonatomic ,strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic ,strong) NSMutableArray *imageArray;
@end
