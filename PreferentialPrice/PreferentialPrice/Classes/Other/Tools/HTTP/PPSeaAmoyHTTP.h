//
//  PPSeaAmoyHTTP.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/21.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPBaseHTTP.h"
#import "PPSeaAmoyParams.h"
#import "PPSeaAmoyResult.h"

@interface PPSeaAmoyHTTP : PPBaseHTTP

+ (void)seaAmoyParameters:(PPSeaAmoyParams *)parameters success:(void (^)(PPSeaAmoyResult *result))success failure:(void (^)(NSError *error))failure;

@end
