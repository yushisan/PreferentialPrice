//
//  PPHotResult.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPHotResult.h"
#import "PPHotData.h"

@implementation PPHotResult

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"data" : [PPHotData class]};
}

@end
