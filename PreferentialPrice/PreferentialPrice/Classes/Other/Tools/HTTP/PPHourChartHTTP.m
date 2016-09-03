//
//  PPHourChartHTTP.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/21.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPHourChartHTTP.h"

@implementation PPHourChartHTTP

+ (void)hourChartParameters:(PPHourChartParams *)parameters success:(void (^)(PPHourChartResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:HourChartURL param:parameters resultClass:[PPHourChartResult class] success:success failure:failure];
}

@end
