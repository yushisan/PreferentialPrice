//
//  PPHourChartParams.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/21.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPHourChartParams : NSObject

/**
 *  时间（格式：20160721）
 */
@property (nonatomic, strong) NSString *date;
/**
 *  时间段（需要查询的时间段）
 */
@property (nonatomic, strong) NSString *hour;

@end
