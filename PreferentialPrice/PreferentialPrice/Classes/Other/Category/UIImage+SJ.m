//
//  UIImage+SJ.m
//
//  Created by YeShaoJian on 14/11/25.
//  Copyright (c) 2014年 YeShaoJian. All rights reserved.
//

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

#import "UIImage+SJ.h"

@implementation UIImage (SJ)

+ (UIImage *)sj_imageWithName:(NSString *)name
{
    UIImage *image = nil;
    if (iOS7) { // 处理iOS7的情况
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    
    return image;
}

+ (UIImage *)sj_stretchedImageWithName:(NSString *)name{
    
    UIImage *image = [UIImage imageNamed:name];
    
    int leftCap = image.size.width * 0.5;
    int topCap = image.size.height * 0.5;
    
    return [image stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}

+ (UIImage *)sj_imageWithRoundIcon:(NSString *)iconName
{
    UIImage *image = [UIImage imageNamed:iconName];
    
    // 创建bitmap上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 绘制圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, image.size.width, image.size.height));
    // 超出的范围剪切
    CGContextClip(ctx);
    // 渲染图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    // 获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return newImage;
}

+ (void)sj_imageSaveWithDocument:(UIImage *)image andSaveName:(NSString *)saveName
{
    // 获取沙盒路径
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:saveName];
    // 打印图片存储路径
    NSLog(@"%@", path);
    // 将图片转换成二进制数据保存
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:path atomically:YES];
}

- (UIImage *)sj_convertToGrayscale {
    CGSize size = [self size];
    int width = size.width;
    int height = size.height;
    
    // 像素将被画成这个数组
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // 清除像素，使透明度得以保留
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // 创建一个RGBA像素背景
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // 绘制位图到我们的上下文中，将填充的像素阵列
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [self CGImage]);
    
    for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            // 转换为灰度使用推荐的方法: http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
            uint32_t gray = 0.3 * rgbaPixel[RED] + 0.59 * rgbaPixel[GREEN] + 0.11 * rgbaPixel[BLUE];
            
            // 将像素设置为灰色
            rgbaPixel[RED] = gray;
            rgbaPixel[GREEN] = gray;
            rgbaPixel[BLUE] = gray;
        }
    }
    
    // 创建一个新的像素
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // 背景，颜色空间和像素
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    // 做一个新的UIImage返回
    UIImage *resultUIImage = [UIImage imageWithCGImage:image];
    
    CGImageRelease(image);
    
    return resultUIImage;
}

+ (UIImage *)sj_imageWithRenderImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)sj_changeImageColorWithImageName:(NSString *)imageName size:(CGSize)size color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 1.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIImage *image = [UIImage imageNamed:imageName];
    CGContextClipToMask(context, rect, image.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
