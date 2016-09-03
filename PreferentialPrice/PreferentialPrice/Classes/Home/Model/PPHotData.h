//
//  PPHotData.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPHotData : NSObject

/**
 *  商品id
 */
@property (nonatomic, strong) NSString *ID;
/**
 *  商品标题
 */
@property (nonatomic, strong) NSString *title;
/**
 *  商品图片
 */
@property (nonatomic, strong) NSString *image;

@end
