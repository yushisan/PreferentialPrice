//
//  PPHotResult.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPHotResult : NSObject

/**
 *  请求状态
 */
@property (nonatomic, strong) NSString *status;
/**
 *  商品数据
 */
@property (nonatomic, strong) NSArray *data;

@end
