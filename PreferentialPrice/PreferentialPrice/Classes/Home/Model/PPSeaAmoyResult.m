//
//  PPSeaAmoyResult.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/21.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPSeaAmoyResult.h"
#import "PPSeaAmoyData.h"

@implementation PPSeaAmoyResult

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"data" : [PPSeaAmoyData class]};
}

@end
