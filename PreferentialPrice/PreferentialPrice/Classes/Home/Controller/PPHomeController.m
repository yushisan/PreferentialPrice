//
//  PPHomeController.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#define TopButtonViewH (35)

#import "PPHomeController.h"
#import "PPSelectionController.h"
#import "PPHourChartController.h"
#import "PPSeaAmoyController.h"
#import "PPHotController.h"
#import "PPSearchController.h"

@interface PPHomeController ()<UIScrollViewDelegate>


@property (nonatomic, weak) UIScrollView *topButtonView;  // 顶部按钮栏
@property (nonatomic, weak) UIScrollView *bottomDetailsView;  // 底部详情栏
@property (nonatomic, strong) UIButton *selectedButton;  // 记录当前选择的按钮
@property (nonatomic, strong) NSMutableArray *allTitleButton;  // 存储所有标题按钮的数组

@end

@implementation PPHomeController

- (NSMutableArray *)allTitleButton {
    
    if (!_allTitleButton) {
        
        _allTitleButton = [NSMutableArray array];
    }
    
    return _allTitleButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 关闭自动添加scrollView额外滚动区域
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 初始化UI
    [self setupUI];
    
    // 添加子控制器
    [self setupAllChildViewController];
    
    // 设置顶部标题栏
    [self setupTopButtonView];
    
}

/**
 *  设置顶部标题栏
 */
- (void)setupTopButtonView {
    
    NSInteger count = self.childViewControllers.count;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = Bounds.size.width / count;
    CGFloat btnH = TopButtonViewH;
    
    for (int i = 0; i<count; i++) {
        
        // 创建按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置按钮
        btn.tag = i;
        btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        UIViewController *VC = self.childViewControllers[i];
        [btn setTitle:VC.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        // 监听按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        // 添加按钮
        [self.topButtonView addSubview:btn];
        
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        
        // 保存按钮
        [self.allTitleButton addObject:btn];
    }
    
    // 设置topButtonView滚动范围
    CGFloat contentW = count * btnW;
    self.topButtonView.contentSize = CGSizeMake(contentW, 0);
    
    // 关闭topButtonView水平指示条
    self.topButtonView.showsHorizontalScrollIndicator = NO;
    
    // 设置bottomScrollView滚动范围
    self.bottomDetailsView.contentSize = CGSizeMake(count * Bounds.size.width, 0);
    // 设置bottomScrollView分页
    self.bottomDetailsView.pagingEnabled = YES;
    // 关闭bottomScrollView水平指示条
    self.bottomDetailsView.showsHorizontalScrollIndicator = NO;
    
    
    
}

/**
 *  顶部按钮点击事件
 */
- (void)btnClick:(UIButton *)btn {
    
    if (self.selectedButton != btn) {
        
        // 设置为选中状态
        btn.selected = YES;
        // 改变对应按钮的颜色
        [btn setTitleColor:SJColorRGBA(93, 227, 94, 1.0) forState:UIControlStateSelected];
        
        [self.selectedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        self.selectedButton.selected = NO;
        
        self.selectedButton = btn;
        
        // 添加对应子控制器的view
        NSInteger i = btn.tag;
        
        UIViewController *VC = self.childViewControllers[i];
        CGFloat x = i * Bounds.size.width;
        CGFloat y = 0;
        CGFloat w = Bounds.size.width;
        CGFloat h = Bounds.size.height - (CGRectGetMaxY(self.navigationController.navigationBar.frame) + + self.tabBarController.tabBar.frame.size.height + TopButtonViewH);
        VC.view.frame = CGRectMake(x, y, w, h);
        
        [self.bottomDetailsView addSubview:VC.view];
        
        // 让scrollView滚动到对应位置
        self.bottomDetailsView.contentOffset = CGPointMake(x, 0);
    }

}

/**
 *  添加子控制器
 */
- (void)setupAllChildViewController {
    
    // 添加精选控制器
    PPSelectionController *selectionVC = [[PPSelectionController alloc] init];
    selectionVC.title = @"精选";
    [self addChildViewController:selectionVC];
    
    // 添加精彩一小时控制器
    PPHourChartController *hourChartVC = [[PPHourChartController alloc] init];
    hourChartVC.title = @"精彩一小时";
    [self addChildViewController:hourChartVC];
    
    // 添加海外淘控制器
    PPSeaAmoyController *seaAmoyVC = [[PPSeaAmoyController alloc] init];
    seaAmoyVC.title = @"海外淘";
    [self addChildViewController:seaAmoyVC];
}

/**
 *  初始化UI
 */
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 导航栏按钮
    // 左边半小时热门
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem sj_itemWithImageName:@"hot_icon_20x20_" highImageName:@"hot_icon_20x20_" nomalTitle:nil highTitle:nil size:0 nomalTitleColor:nil highTitleColor:nil edgeInsets:nil target:self action:@selector(hotClick)];
    // 右边搜索
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem sj_itemWithImageName:@"search_icon_20x20_" highImageName:@"search_icon_20x20_" nomalTitle:nil highTitle:nil size:0 nomalTitleColor:nil highTitleColor:nil edgeInsets:nil target:self action:@selector(searchClick)];
    
    // 顶部按钮栏
    UIScrollView *topButtonView = [[UIScrollView alloc] init];
    topButtonView.frame = CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), Bounds.size.width, TopButtonViewH);
    topButtonView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:topButtonView];
    self.topButtonView = topButtonView;
    
    // 底部详情栏
    CGFloat bottomW = Bounds.size.width;
    CGFloat bottomH = Bounds.size.height - (CGRectGetMaxY(topButtonView.frame) + self.tabBarController.tabBar.frame.size.height);
    CGFloat bottomX = 0;
    CGFloat bottomY = CGRectGetMaxY(topButtonView.frame);
    
    UIScrollView *bottomDetailsView = [[UIScrollView alloc] init];
    bottomDetailsView.frame = CGRectMake(bottomX, bottomY, bottomW, bottomH);
    bottomDetailsView.delegate = self;
    [self.view addSubview:bottomDetailsView];
    self.bottomDetailsView = bottomDetailsView;
    
}

#pragma mark - 导航栏点击监听
/**
 *  近半小时热门
 */
- (void)hotClick {
    
    PPHotController *hotVC = [[PPHotController alloc] init];
    [self.navigationController pushViewController:hotVC animated:YES];
    
}
/**
 *  搜索
 */
- (void)searchClick {
    
    PPSearchController *hotVC = [[PPSearchController alloc] init];
    [self.navigationController pushViewController:hotVC animated:YES];
}

#pragma mark - UIScrollView代理

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 获取选中的标题按钮
    NSInteger i = scrollView.contentOffset.x / Bounds.size.width;
    UIButton *btn = self.allTitleButton[i];
    
    // 选中标题
    [self btnClick:btn];
    
}

@end
