//
//  PPSeaAmoyData.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/21.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSeaAmoyData : NSObject

/**
 *  商品ID
 */
@property (nonatomic, strong) NSString *ID;
/**
 *  标题
 */
@property (nonatomic, strong) NSString *title;
/**
 *  更新时间
 */
@property (nonatomic, strong) NSString *pubtime;
/**
 *  图片
 */
@property (nonatomic, strong) NSString *image;
/**
 *  图片宽度
 */
@property (nonatomic, strong) NSString *imgw;
/**
 *  图片高度
 */
@property (nonatomic, strong) NSString *imgh;
/**
 *  来源
 */
@property (nonatomic, strong) NSString *mall;
/**
 *  是否有购买链接
 */
@property (nonatomic, strong) NSString *iftobuy;
/**
 *  购买链接
 */
@property (nonatomic, strong) NSString *buyurl;
/**
 *  消息来源
 */
@property (nonatomic, strong) NSString *fromsite;
/**
 *  交易特征
 */
@property (nonatomic, strong) NSString *dealfeature;

@end
