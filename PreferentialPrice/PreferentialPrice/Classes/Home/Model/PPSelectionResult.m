//
//  PPSelectionResult.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPSelectionResult.h"
#import "PPSelectionData.h"

@implementation PPSelectionResult

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"data" : [PPSelectionData class]};
}

@end
