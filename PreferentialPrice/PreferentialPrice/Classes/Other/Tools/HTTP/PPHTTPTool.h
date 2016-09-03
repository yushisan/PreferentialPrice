//
//  PPHTTPTool.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPHTTPTool : NSObject

/**
 *  get请求
 *
 *  @param url        请求地址
 *  @param parameters 请求参数
 *  @param progress   进度
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)getWithURL:(nonnull NSString *)url parameters:(nullable id)parameters progress:(nullable void (^)(NSProgress * _Nonnull downloadProgress))progress success:(nullable void (^)(id _Nullable responseObject))success failure:(nullable void (^)(NSError * _Nonnull error))failure;

/**
 *  post请求
 *
 *  @param url        请求地址
 *  @param parameters 请求参数
 *  @param progress   进度
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)postWithURL:(nonnull NSString *)url parameters:(nullable id)parameters progress:(nullable void (^)(NSProgress * _Nonnull downloadProgress))progress success:(nullable void (^)(id _Nullable responseObject))success failure:(nullable void (^)(NSError * _Nonnull error))failure;

/**
 *  post上传文件请求
 *
 *  @param url                       请求地址
 *  @param parameters                请求参数
 *  @param constructingBodyWithBlock 需要上传的文件
 *  @param progress                  进度
 *  @param success                   请求成功回调
 *  @param failure                   请求失败回调
 */
+ (void)postWithURL:(nonnull NSString *)url parameters:(nullable id)parameters constructingBodyWithBlock:(nonnull void (^)(id<AFMultipartFormData> _Nonnull formData))constructingBodyWithBlock progress:(nullable void (^)(NSProgress * _Nonnull))progress success:(nullable void (^)(id _Nullable))success failure:(nullable void (^)(NSError * _Nonnull))failure;

/**
 *  开启网络监控
 *
 *  @param block 回调
 */
+ (void)startMonitoringNetWorkChangeBlock:(nonnull void (^)(AFNetworkReachabilityStatus status))block;

/**
 *  关闭网络监控
 */
+ (void)stopMonitoring;

@end
