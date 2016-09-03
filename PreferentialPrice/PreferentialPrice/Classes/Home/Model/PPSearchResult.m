//
//  PPSearchResult.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPSearchResult.h"
#import "PPSearchData.h"

@implementation PPSearchResult

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"data" : [PPSearchData class]};
}

@end
