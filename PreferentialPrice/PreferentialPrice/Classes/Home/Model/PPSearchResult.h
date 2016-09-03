//
//  PPSearchResult.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSearchResult : NSObject

/**
 *  请求状态
 */
@property (nonatomic, strong) NSString *status;
/**
 *  共有多少数据
 */
@property (nonatomic, strong) NSString *newincluded;
/**
 *  数据详情
 */
@property (nonatomic, strong) NSArray *data;

@end
