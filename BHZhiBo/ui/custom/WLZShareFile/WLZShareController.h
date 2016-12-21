//
//  WLZShareController.h
//  WLZShareView
//
//  Created by lijiarui on 15/11/11.
//  Copyright © 2015年 lijiarui qq:81995383. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLZBlockButton.h"
@interface WLZShareController : UIViewController




- (void)addItem:(NSString *)title icon:(NSString *)icon hightLightIcon:(NSString *)hightLightIcon  block:(void (^)(WLZBlockButton *))block ;


-(void)show;

@end
