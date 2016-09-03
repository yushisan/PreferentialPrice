//
//  PPSeaAmoyResult.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/21.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSeaAmoyResult : NSObject

/**
 *  请求状态
 */
@property (nonatomic, strong) NSString *status;
/**
 *  截止时间段
 */
@property (nonatomic, strong) NSString *rankhour;
/**
 *  截止日期
 */
@property (nonatomic, strong) NSString *rankdate;
/**
 *  显示日期
 */
@property (nonatomic, strong) NSString *displaydate;
/**
 *  显示时间段
 */
@property (nonatomic, strong) NSString *rankduring;
/**
 *  当前日期
 */
@property (nonatomic, strong) NSString *lasthourdate;
/**
 *  当前时间段
 */
@property (nonatomic, strong) NSString *lasthourhour;
/**
 *  数据包
 */
@property (nonatomic, strong) NSArray *data;

@end
