//
//  PPMainController.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/11.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPMainController.h"
#import "PPHomeController.h"
#import "PPNavigationController.h"
#import "PPMessageController.h"
#import "PPMeController.h"
#import "PPSelectionController.h"

@interface PPMainController ()

@end

@implementation PPMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化UI
    [self setupUI];
    
    // 添加子控制器
    [self setupSubController];
}

/**
 *  初始化UI
 */
- (void)setupUI {
    
    // 改变图片颜色
    [[UITabBar appearance] setTintColor:SJColorRGBA(93, 227, 94, 1.0)];
    // 改变字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:SJColorRGBA(93, 227, 94, 1.0), NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
}

- (void)setupSubController {

    // 首页
    PPHomeController *homeVC = [[PPHomeController alloc] init];
    [self addOneController:homeVC title:@"惠购" image:@"tabbar_home_30x30_" selectedImage:@"tabbar_home_selected_30x30_"];
    
    // 会话
    PPMessageController *messageVC = [PPMessageController alloc];
    [self addOneController:messageVC title:@"会话" image:@"tabbar_abroad_30x30_" selectedImage:@"tabbar_abroad_selected_30x30_"];
    // 我的
    PPMeController *meVC = [[PPMeController alloc] init];
    [self addOneController:meVC title:@"我的" image:@"tabbar_rank_30x30_" selectedImage:@"tabbar_rank_selected_30x30_"];
    
}

/**
 *  添加一个子控制器
 */
- (void)addOneController:(UIViewController *)controller title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    controller.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 包装导航控制器
    PPNavigationController *naviVC = [[PPNavigationController alloc] initWithRootViewController:controller];
    // 添加子控制器
    [self addChildViewController:naviVC];
}

@end
