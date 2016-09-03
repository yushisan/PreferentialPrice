//
//  PPSeaAmoyParams.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/21.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSeaAmoyParams : NSObject


/**
 *  每次返回数据个数（必须）
 */
@property (nonatomic, strong) NSString *count;
/**
 *  最新请求结果中最后一个商品ID（获取更多时传递）
 */
@property (nonatomic, strong) NSString *sinceid;
/**
 *  电商名称（当指定某个电商时传递）
 */
@property (nonatomic, strong) NSString *mall;
/**
 *  区域
 */
@property (nonatomic, strong) NSString *country;

@end
