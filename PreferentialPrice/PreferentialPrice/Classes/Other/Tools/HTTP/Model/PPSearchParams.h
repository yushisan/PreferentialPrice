//
//  PPSearchParams.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSearchParams : NSObject

/**
 *  返回最大商品个数
 */
@property (nonatomic, strong) NSString *count;
/**
 *  用户查询关键字
 */
@property (nonatomic, strong) NSString *q;
/**
 *  搜索结果最后的数据id（加载更多时使用）
 */
@property (nonatomic, strong) NSString *sinceid;

@end
