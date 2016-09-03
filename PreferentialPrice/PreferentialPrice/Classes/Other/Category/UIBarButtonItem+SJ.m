//
//  UIBarButtonItem+SJ.m
//
//  Created by ysj on 14/6/7.
//  Copyright (c) 2014年 yeshaojian. All rights reserved.
//

#import "UIBarButtonItem+SJ.h"

@implementation UIBarButtonItem (SJ)

+ (UIBarButtonItem *)sj_itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName nomalTitle:(NSString *)nomalTitle highTitle:(NSString *)highTitle size:(CGFloat)size nomalTitleColor:(UIColor *)nomalTitleColor highTitleColor:(UIColor *)highTitleColor edgeInsets:(UIEdgeInsets *)edgeInsets target:(id)target action:(SEL)action;
{
    UIButton *button = [[UIButton alloc] init];
    
    UIImage *image = [UIImage sj_changeImageColorWithImageName:imageName size:CGSizeMake(20, 20) color:SJColorRGBA(93, 227, 94, 1.0)];
    
    [button setBackgroundImage:image forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    
    if (nomalTitle) [button setTitle:nomalTitle forState:UIControlStateNormal];
    if (highTitle)  [button setTitle:highTitle forState:UIControlStateHighlighted];
    if (size > 0)   button.titleLabel.font = [UIFont systemFontOfSize:size];
    if (nomalTitleColor) [button setTitleColor:nomalTitleColor forState:UIControlStateNormal];
    if (highTitleColor) [button setTitleColor:highTitleColor forState:UIControlStateHighlighted];
    if (edgeInsets)   button.contentEdgeInsets = *(edgeInsets);
    //  自适应尺寸
    [button sizeToFit];
    //  包装按钮（避免误触）
    UIView *buttonView = [[UIView alloc] initWithFrame:button.bounds];
    [buttonView addSubview:button];
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:buttonView];
}

@end
