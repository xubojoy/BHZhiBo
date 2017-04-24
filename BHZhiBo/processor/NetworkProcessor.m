//
//  NetworkProcessor.m
//  CrazyDoctor
//
//  Created by xubojoy on 16/4/14.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "NetworkProcessor.h"

@implementation NetworkProcessor
-(void) initNetWork{
    NSLog(@">>>>> init NetWork ");
    //开启网络指示器，开始监听
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        switch(status){
                
            case AFNetworkReachabilityStatusUnknown:{
                
                NSLog(@"未知网络状态");
            }
                break;
                
            case AFNetworkReachabilityStatusNotReachable:{
                
                NSLog(@"网络不通");
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                
                NSLog(@"2G/3G/4G/GPRS联网");
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"WiFi联网");
            }
                
                break;
                
            default:
                
                break;
        }

    }];
    
}

@end
