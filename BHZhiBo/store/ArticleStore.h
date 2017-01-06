//
//  ArticleStore.h
//  CrazyDoctor
//
//  Created by xubojoy on 16/5/19.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Page.h"
@interface ArticleStore : NSObject

+ (void)getRecommendArticles:(void(^)(Page *page ,NSError *error))completionBlock pageSize:(int)pageSize;

@end
