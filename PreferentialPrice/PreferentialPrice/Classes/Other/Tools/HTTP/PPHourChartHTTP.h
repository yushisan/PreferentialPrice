//
//  PPHourChartHTTP.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/21.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPBaseHTTP.h"
#import "PPHourChartParams.h"
#import "PPHourChartResult.h"

@interface PPHourChartHTTP : PPBaseHTTP

+ (void)hourChartParameters:(PPHourChartParams *)parameters success:(void (^)(PPHourChartResult *result))success failure:(void (^)(NSError *error))failure;

@end
