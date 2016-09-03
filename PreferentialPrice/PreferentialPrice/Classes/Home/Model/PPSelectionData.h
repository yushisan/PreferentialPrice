//
//  PPSelectionData.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSelectionData : NSObject

/**
 *  数据内容
 */
@property (nonatomic, strong) NSString *ID;
/**
 *  商品标题
 */
@property (nonatomic, strong) NSString *title;
/**
 *  商品图片URL
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
 *  区域
 */
@property (nonatomic, strong) NSString *country;
/**
 *  电商平台
 */
@property (nonatomic, strong) NSString *mall;
/**
 *  购买跳转URL
 */
@property (nonatomic, strong) NSString *buyurl;
/**
 *  消息来源
 */
@property (nonatomic, strong) NSString *fromsite;
/**
 *  时间
 */
@property (nonatomic, strong) NSString *pubtime;

@end
