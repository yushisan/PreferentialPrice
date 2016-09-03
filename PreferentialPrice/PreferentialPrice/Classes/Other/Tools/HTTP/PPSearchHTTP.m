//
//  PPSearchHTTP.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPSearchHTTP.h"

@implementation PPSearchHTTP

+ (void)searchWithParameters:(PPSearchParams *)parameters success:(void (^)(PPSearchResult *))success failure:(void (^)(NSError *))failure {

    [self getWithUrl:SearchURL param:parameters resultClass:[PPSearchResult class] success:success failure:failure];
}

@end
