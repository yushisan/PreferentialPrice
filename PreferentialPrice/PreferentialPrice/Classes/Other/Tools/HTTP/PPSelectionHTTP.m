//
//  PPSelectionHTTP.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPSelectionHTTP.h"

@implementation PPSelectionHTTP

+ (void)selectionParameters:(PPSelectionParames *)parameters success:(void (^)(PPSelectionResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:SelectionURL param:parameters resultClass:[PPSelectionResult class] success:success failure:failure];
}

@end
