//
//  PPSearchHTTP.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPBaseHTTP.h"
#import "PPSearchParams.h"
#import "PPSearchResult.h"

@interface PPSearchHTTP : PPBaseHTTP

+ (void)searchWithParameters:(PPSearchParams *)parameters success:(void (^)(PPSearchResult *result))success failure:(void (^)(NSError *error))failure;

@end
