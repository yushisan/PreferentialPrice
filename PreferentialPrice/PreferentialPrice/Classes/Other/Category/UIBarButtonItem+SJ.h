//
//  UIBarButtonItem+SJ.h
//
//  Created by ysj on 14/6/7.
//  Copyright (c) 2014年 yeshaojian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SJ)

/**
*  自定义BarButtonItem(默认和高亮状态)
*
*  @param imageName     默认图片
*  @param highImageName 高亮图片
*  @param nomalTitle    默认标题
*  @param highTitle     高亮标题
*  @param size          文字大小
*  @param target        管理者
*  @param action        调用的方法
*
*  @return UIBarButtonItem
*/
+ (UIBarButtonItem *)sj_itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName nomalTitle:(NSString *)nomalTitle highTitle:(NSString *)highTitle size:(CGFloat)size nomalTitleColor:(UIColor *)nomalTitleColor highTitleColor:(UIColor *)highTitleColor edgeInsets:(UIEdgeInsets *)edgeInsets target:(id)target action:(SEL)action;

@end
