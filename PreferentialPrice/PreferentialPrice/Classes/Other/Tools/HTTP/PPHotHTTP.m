//
//  PPHotHTTP.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPHotHTTP.h"

@implementation PPHotHTTP

+ (void)hotWithParameters:(PPHotParams *)parameters success:(void (^)(PPHotResult *))success failure:(void (^)(NSError *))failure {
    
    [self getWithUrl:HotURL param:parameters resultClass:[PPHotResult class] success:success failure:failure];
}

@end
