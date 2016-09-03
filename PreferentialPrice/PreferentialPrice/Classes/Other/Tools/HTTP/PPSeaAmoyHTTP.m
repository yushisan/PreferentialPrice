//
//  PPSeaAmoyHTTP.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/21.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPSeaAmoyHTTP.h"

@implementation PPSeaAmoyHTTP

+ (void)seaAmoyParameters:(PPSeaAmoyParams *)parameters success:(void (^)(PPSeaAmoyResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:SeaAmoyURL param:parameters resultClass:[PPSeaAmoyResult class] success:success failure:failure];
}

@end
