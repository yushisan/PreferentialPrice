//
//  PPBaseHTTP.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPBaseHTTP.h"
#import "PPHTTPTool.h"

@implementation PPBaseHTTP

+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id responseObject))success failure:(void (^)(NSError *))failure {
    
    [PPHTTPTool getWithURL:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(id  _Nullable responseObject) {
        if (success) {
            id result = [resultClass mj_objectWithKeyValues:responseObject];
            success(result);
        }
    } failure:^(NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end

