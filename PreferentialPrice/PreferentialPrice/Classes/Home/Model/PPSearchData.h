//
//  PPSearchData.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSearchData : NSObject

/**
 *  商品ID
 */
@property (nonatomic, strong) NSString *ID;
/**
 *  商品标题
 */
@property (nonatomic, strong) NSString *title;
/**
 *  发布时间
 */
@property (nonatomic, strong) NSString *pubtime;
/**
 *  图片
 */
@property (nonatomic, strong) NSString *image;
/**
 *  图片宽
 */
@property (nonatomic, strong) NSString *imgw;
/**
 *  图片高
 */
@property (nonatomic, strong) NSString *imgh;
/**
 *  是否有购买链接
 */
@property (nonatomic, strong) NSString *iftobuy;
/**
 *  来源个数
 */
@property (nonatomic, strong) NSString *fromsite;
/**
 *  地区
 */
@property (nonatomic, strong) NSString *country;
/**
 *  销售平台
 */
@property (nonatomic, strong) NSString *mall;
/**
 *  购买链接
 */
@property (nonatomic, strong) NSString *buyurl;

@end
