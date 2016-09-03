//
//  PPSelectionResult.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSelectionResult : NSObject

/**
 *  请求状态
 */
@property (nonatomic, strong) NSString *status;
/**
 *  返回数据个数
 */
@property (nonatomic, strong) NSString *newincluded;
/**
 *  数据详情
 */
@property (nonatomic, strong) NSArray *data;

@end
