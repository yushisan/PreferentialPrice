//
//  UIButton+SJ.m
//
//  Created by YeShaoJian on 14/11/7.
//  Copyright (c) 2014年 YeShaoJian. All rights reserved.
//

#import "UIButton+SJ.h"

@implementation UIButton (SJ)

- (void)sj_setNormalName:(NSString *)NormalName HighlichtedName:(NSString *)HighlichtedName
{
    [self setImage:[UIImage imageNamed:NormalName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:HighlichtedName] forState:UIControlStateHighlighted];
}

-(void)sj_setNormalBG:(NSString *)normalBG HighlightedBG:(NSString *)HighlightedBG{
    [self setBackgroundImage:[UIImage imageNamed:normalBG] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:HighlightedBG] forState:UIControlStateHighlighted];
}

-(void)sj_setStretchedNormalBG:(NSString *)normalBG HighlightedBG:(NSString *)HighlightedBG{
    [self setBackgroundImage:[UIImage sj_stretchedImageWithName:normalBG] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage sj_stretchedImageWithName:HighlightedBG] forState:UIControlStateHighlighted];
}

@end
