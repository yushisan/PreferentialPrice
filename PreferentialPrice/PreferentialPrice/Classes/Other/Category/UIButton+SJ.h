//
//  UIButton+SJ.h
//
//  Created by YeShaoJian on 14/11/7.
//  Copyright (c) 2014年 YeShaoJian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SJ)

/**
 * 设置普通状态与高亮状态的内部图片
 *
 * @param NormalName 默认图片
 * @param HighlichtedName 高亮图片
 *
 */
- (void)sj_setNormalName:(NSString *)NormalName HighlichtedName:(NSString *)HighlichtedName;

/**
* 设置普通状态与高亮状态的背景图片
*
* @param nomalBG 默认图片
* @param highBG 高亮图片
*
*/
-(void)sj_setNormalBG:(NSString *)normalBG HighlightedBG:(NSString *)HighlightedBG;

/**
 * 设置普通状态与高亮状态的拉伸后背景图片
 *
 * @param nomalBG 默认图片
 * @param highBG 高亮图片
 *
 */
-(void)sj_setStretchedNormalBG:(NSString *)normalBG HighlightedBG:(NSString *)HighlightedBG;

@end
