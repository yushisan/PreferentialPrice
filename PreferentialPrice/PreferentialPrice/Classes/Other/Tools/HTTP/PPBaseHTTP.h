//
//  PPBaseHTTP.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPBaseHTTP : NSObject

+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)
resultClass success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
