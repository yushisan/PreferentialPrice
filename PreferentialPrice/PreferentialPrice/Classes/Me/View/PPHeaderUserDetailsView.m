//
//  PPHeaderUserDetailsView.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/25.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPHeaderUserDetailsView.h"

@interface PPHeaderUserDetailsView()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *synopsis;

@end

@implementation PPHeaderUserDetailsView

- (void)awakeFromNib {

    self.icon.image = [UIImage sj_imageWithRoundIcon:@"lufei.jpg"];
}

@end
