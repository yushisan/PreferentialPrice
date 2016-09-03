//
//  PPHTTPTool.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPHTTPTool.h"

@implementation PPHTTPTool

+ (void)getWithURL:(NSString *)url parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))progress success:(void (^)(id _Nullable))success failure:(void (^)(NSError * _Nonnull))failure
{
    
    NSDictionary *params = [parameters mj_keyValues];
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        SJLog(@"请求成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        SJLog(@"请求失败%@", error);
    }];
    
}

+ (void)postWithURL:(NSString *)url parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))progress success:(void (^)(id _Nullable))success failure:(void (^)(NSError * _Nonnull))failure
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr POST:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        SJLog(@"请求成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        SJLog(@"请求失败%@", error);
    }];
    
}

+ (void)postWithURL:(NSString *)url parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> _Nonnull formData))constructingBodyWithBlock progress:(void (^)(NSProgress * _Nonnull))progress success:(void (^)(id _Nullable))success failure:(void (^)(NSError * _Nonnull))failure
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (constructingBodyWithBlock) {
            constructingBodyWithBlock(formData);
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        SJLog(@"请求成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        SJLog(@"请求失败%@", error);
    }];
    
}

+ (void)startMonitoringNetWorkChangeBlock:(void (^)(AFNetworkReachabilityStatus))block
{
    //  监控网络
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager manager];
    
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (block) {
            block(status);
        }
    }];
    
    //  开启监控
    [mgr startMonitoring];
}

+ (void)stopMonitoring
{
    //  监控网络
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager manager];
    
    //  停止监控
    [mgr stopMonitoring];
}

@end
