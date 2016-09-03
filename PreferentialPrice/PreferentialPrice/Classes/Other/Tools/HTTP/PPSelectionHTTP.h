//
//  PPSelectionHTTP.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPBaseHTTP.h"
#import "PPSelectionParames.h"
#import "PPSelectionResult.h"

@interface PPSelectionHTTP : PPBaseHTTP

+ (void)selectionParameters:(PPSelectionParames *)parameters success:(void (^)(PPSelectionResult *result))success failure:(void (^)(NSError *error))failure;

@end
