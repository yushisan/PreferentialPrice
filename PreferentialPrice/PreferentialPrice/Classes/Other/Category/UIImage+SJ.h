//
//  UIImage+SJ.h
//
//  Created by YeShaoJian on 14/11/25.
//  Copyright (c) 2014年 YeShaoJian. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef enum {
    ALPHA = 0,
    BLUE = 1,
    GREEN = 2,
    RED = 3
} PIXELS;

@interface UIImage (SJ)

/**
 *  根据图片名自动加载适配iOS6\7的图片
 */
+ (UIImage *)sj_imageWithName:(NSString *)name;

/**
* 返回中心拉伸的图片
*
* @param name 图片
*
*/
+ (UIImage *)sj_stretchedImageWithName:(NSString *)name;

/**
 * 图片剪切（普通圆）
 *
 * @param iconName 需要剪切的图片
 *
 */
+ (UIImage *)sj_imageWithRoundIcon:(NSString *)iconName;

/**
 *  存储图片
 *
 *  @param image 要存储的图片
 *  @param saveName 要存储的文件名
 *
 */
+ (void)sj_imageSaveWithDocument:(UIImage *)image andSaveName:(NSString *)saveName;

/**
 *  图片转灰度
 *
 */
- (UIImage *)sj_convertToGrayscale;

/**
 *  返回一张不经过系统渲染的图片
 *
 *  @param imageName 图片名称
 */
+ (UIImage *)sj_imageWithRenderImageName:(NSString *)imageName;

/**
 *  修改图片渲染颜色
 *
 *  @param imageName 需要渲染的图片名
 *  @param size      图片大小
 *  @param color     需要渲染的颜色
 *
 */
+ (UIImage *)sj_changeImageColorWithImageName:(NSString *)imageName size:(CGSize)size color:(UIColor *)color;

@end
