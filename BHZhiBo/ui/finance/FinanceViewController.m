//
//  FinanceViewController.m
//  BHZhiBo
//
//  Created by xubojoy on 2016/12/21.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "FinanceViewController.h"
#import "LoadingStatusView.h"
@interface FinanceViewController ()
{
    LoadingStatusView *loading;
}
@end

@implementation FinanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initHeadView];
    [self loadWebView];
}
//初始化自定义导航
-(void)initHeadView{
    self.headerView = [[HeaderView alloc] initWithTitle:@"财经" navigationController:self.navigationController];
    self.headerView.backBut.hidden = YES;
    self.headerView.userInteractionEnabled = YES;
    [self.view addSubview:self.headerView];
    
    loading = [[LoadingStatusView alloc] initWithFrame:loading_frame];
    [loading updateStatus:network_status_loading animating:YES];
    [self.view addSubview:loading];
}

-(void)loadWebView{
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, self.headerView.frame.size.height+splite_line_height, screen_width, screen_height-self.headerView.frame.size.height-tabbar_height)];
    NSURL *nsurl =[NSURL URLWithString:@"http://www.jin10.com/example/jin10.com.html"];
    NSURLRequest *request =[NSURLRequest requestWithURL:nsurl];
    [self.webView loadRequest:request];
    
    self.webView.delegate = self;
    self.webView.scrollView.delegate = self;
    [self.view addSubview:self.webView];
    [self.webView setBackgroundColor:[UIColor clearColor]];
//    [self.view bringSubviewToFront:self.headerView];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [loading updateStatus:network_status_loading animating:YES];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    [loading setHidden:YES];
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)inRequest   navigationType:(UIWebViewNavigationType)inType
{
    NSLog(@">>>>> to:%@", inRequest.URL);
    return YES;
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@">>>> web load error:%@", webView.request.URL);
    loading.hidden = YES;
    [loading updateStatus:network_unconnect_note animating:NO];
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
