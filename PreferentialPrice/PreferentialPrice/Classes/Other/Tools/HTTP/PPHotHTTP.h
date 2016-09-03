//
//  PPHotHTTP.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPBaseHTTP.h"
#import "PPHotParams.h"
#import "PPHotResult.h"

@interface PPHotHTTP : PPBaseHTTP

+ (void)hotWithParameters:(PPHotParams *)parameters success:(void (^)(PPHotResult *result))success failure:(void (^)(NSError *error))failure;

@end
