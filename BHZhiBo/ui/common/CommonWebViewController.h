//
//  CommonWebViewController.h
//  BHZhiBo
//
//  Created by xubojoy on 2016/12/22.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonWebViewController : BaseViewController<UIWebViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) HeaderView *headerView;
@property (strong, nonatomic) UIWebView *webView;
@property (nonatomic ,strong) NSString *branchUrl;
@property (nonatomic ,strong) NSString *titleName;

- (instancetype)initWithUrl:(NSString *)url title:(NSString *)title;

@end
