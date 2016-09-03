//
//  PPSearchController.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#define dataCount (@"30")

#import "PPSearchController.h"
#import "PPSearchParams.h"
#import "PPSearchResult.h"
#import "PPSearchHTTP.h"
#import "PPSearchData.h"
#import "PPDetailsCell.h"
#import <MJRefresh.h>

@interface PPSearchController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, weak) UITextField *searchField;  // 搜索框
@property (nonatomic, weak) UITableView *detailsView;  // 详情栏
@property (nonatomic, weak) UIView *noDataView;  // 没有数据时的View

@property (nonatomic, strong) NSMutableArray *searchData;
@property (nonatomic, assign) BOOL moreData;  // 是否有更多数据

@end

@implementation PPSearchController

static NSString * const cellID = @"detailsCell";

- (NSMutableArray *)searchData {

    if (!_searchData) {
        
        _searchData = [NSMutableArray array];
    }
    
    return _searchData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化UI
    [self setupUI];
    
    self.detailsView.rowHeight = 120;
    
    // 添加下拉刷新
    self.detailsView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    // 添加上拉加载更多
    self.detailsView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

/**
 *  加载最新数据
 */
- (void)loadData {
    
    self.moreData = NO;
    
    PPSearchParams *params = [[PPSearchParams alloc] init];
    params.count = dataCount;
    params.q = self.searchField.text;
    
    [PPSearchHTTP searchWithParameters:params success:^(PPSearchResult *result) {
        
        [self.detailsView.mj_header endRefreshing];
        
        self.searchData = result.data;
        
        if (result.newincluded.integerValue <= 0) {
            // 隐藏底部详情栏
            self.detailsView.hidden = YES;
            // 展示没有数据View
            self.noDataView.hidden = NO;
        }else {
            
            // 显示底部详情栏
            self.detailsView.hidden = NO;
            // 隐藏没有数据的View
            self.noDataView.hidden = YES;
            
            if (result.newincluded.integerValue >= dataCount.integerValue) { // 数据总数大于最大返回值
                self.moreData = YES;
                
                // 保存最后一个商品id
                PPSearchData *lastData = [result.data lastObject];
                [[NSUserDefaults standardUserDefaults] setObject:lastData.ID forKey:@"searchLastID"];
            }
            
            [self.detailsView reloadData];
        }
        
    } failure:^(NSError *error) {
        // 隐藏底部详情栏
        self.detailsView.hidden = YES;
        // 展示没有数据View
        self.noDataView.hidden = NO;
    }];
}

/**
 *  加载更多数据
 */
- (void)loadMoreData {
    
    if (self.moreData == YES) {
        
        PPSearchParams *params = [[PPSearchParams alloc] init];
        params.count = dataCount;
        params.q = self.searchField.text;
        params.sinceid = [[NSUserDefaults standardUserDefaults] objectForKey:@"searchLastID"];
        
        [PPSearchHTTP searchWithParameters:params success:^(PPSearchResult *result) {
            
            [self.detailsView.mj_footer endRefreshing];
            
            NSArray *newArray = result.data;
            
            if (result.newincluded <= 0) {
                
                // 隐藏底部详情栏
                self.detailsView.hidden = YES;
                // 展示没有数据View
                self.noDataView.hidden = NO;
            }else {
            
                [self.searchData addObjectsFromArray:newArray];
                
                if (result.newincluded.integerValue >= dataCount.integerValue) { // 数据总数大于最大返回值
                    self.moreData = YES;
                
                    // 保存最后一个商品id
                    PPSearchData *lastData = [result.data lastObject];
                    [[NSUserDefaults standardUserDefaults] setObject:lastData.ID forKey:@"searchLastID"];
                }else {
                    
                    self.moreData = NO;
                }
                
                [self.detailsView reloadData];

            }
            
        } failure:^(NSError *error) {

        }];
    }else {
        
        [self.detailsView.mj_footer endRefreshingWithNoMoreData];
    }
    
}

- (void)setupUI {
    
    // 顶部搜索栏
    UITextField *searchField = [[UITextField alloc] init];
    searchField.frame = CGRectMake(0, 64, Bounds.size.width, 35);
    searchField.delegate = self;
    searchField.keyboardType = UIKeyboardTypeDefault;
    searchField.backgroundColor = SJColorRGBA(93, 227, 94, 1.0);
    searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
    searchField.placeholder = @"请输入需要搜索的关键字";
    [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    searchField.textColor = [UIColor whiteColor];
    searchField.tintColor = [UIColor whiteColor];
    [searchField sj_addLeftViewWithImage:@"search_icon_20x20_"];
    [self.view addSubview:searchField];
    self.searchField = searchField;
    
    // 底部详情栏
    UITableView *detailsView = [[UITableView alloc] init];
    detailsView.hidden = YES;
    [detailsView registerNib:[UINib nibWithNibName:@"PPDetailsCell" bundle:nil] forCellReuseIdentifier:cellID];
    detailsView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    detailsView.delegate = self;
    detailsView.dataSource = self;
    [self.view addSubview:detailsView];
    self.detailsView = detailsView;
    
    // 无数据时界面
    UIView *noDataView = [[UIView alloc] init];
    noDataView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:noDataView];
    self.noDataView = noDataView;
    
    // 设置布局
    [self setupLayout];
}

- (void)setupLayout {
    
    [self.detailsView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.top.equalTo(self.searchField.bottom).equalTo(0);
    }];
    
    [self.noDataView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.top.equalTo(self.searchField.bottom).equalTo(0);
    }];
}

#pragma mark - tableView代理和数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.searchData.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    PPDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    PPSearchData *data = self.searchData[indexPath.row];
    
    cell.searchData = data;
    
    return cell;
}

#pragma mark - textField代理

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    textField.placeholder = nil;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {

    textField.placeholder = @"请输入需要搜索的关键字";
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 开启上拉刷新
    [self.detailsView.mj_footer beginRefreshing];
    // 加载数据
    [self loadData];
    // 隐藏键盘
    [self hiddenKeyboard];
    
    return YES;
}

- (void)hiddenKeyboard {

    [self.view endEditing:YES];
}

@end
