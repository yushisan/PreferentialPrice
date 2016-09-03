//
//  NSData+SJ.h
//
//  Created by YeShaoJian on 14/12/26.
//  Copyright (c) 2014年 YeShaoJian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SJ)

/**
 *  是否为今天
 */
- (BOOL)sj_isToday;
/**
 *  是否为昨天
 */
- (BOOL)sj_isYesterday;
/**
 *  是否为今年
 */
- (BOOL)sj_isThisYear;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)sj_dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)sj_deltaWithNow;

@end
