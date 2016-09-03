//
//  PPHourChartResult.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/21.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPHourChartResult.h"
#import "PPHourChartData.h"

@implementation PPHourChartResult

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"data" : [PPHourChartData class]};
}


@end
