//
//  PPSeaAmoyController.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#define DataCount (@"30")

#import "PPSeaAmoyController.h"
#import "PPDetailsCell.h"
#import "PPSeaAmoyParams.h"
#import "PPSeaAmoyResult.h"
#import "PPSeaAmoyHTTP.h"
#import "PPSeaAmoyData.h"
#import <MJRefresh.h>

@interface PPSeaAmoyController ()

@property (nonatomic, strong) NSMutableArray *seaAmoyData;

@end

@implementation PPSeaAmoyController

static NSString * const cellID = @"detailsCell";

- (NSMutableArray *)seaAmoyData {
    
    if (!_seaAmoyData) {
        
        _seaAmoyData = [NSMutableArray array];
    }
    
    return _seaAmoyData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 120;
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"PPDetailsCell" bundle:nil] forCellReuseIdentifier:cellID];
    
    // 添加下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.tableView.mj_header beginRefreshing];
    
    // 添加上拉加载更多
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

/**
 *   加载最新数据
 */
- (void)loadData {
    
    PPSeaAmoyParams *param = [[PPSeaAmoyParams alloc] init];
    param.country = @"us";
    param.count = DataCount;
    
    [PPSeaAmoyHTTP seaAmoyParameters:param success:^(PPSeaAmoyResult *result) {
        
        [self.tableView.mj_header endRefreshing];
        
        self.seaAmoyData = result.data;
        
        // 保存数据中最后一个商品的ID
        PPSeaAmoyData *lastData = [result.data lastObject];
        
        [[NSUserDefaults standardUserDefaults] setObject:lastData.ID forKey:@"seaAmoyLastID"];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

/**
 *  加载更多数据
 */
- (void)loadMoreData {
    
    PPSeaAmoyParams *param = [[PPSeaAmoyParams alloc] init];
    param.country = @"us";
    param.count = DataCount;
    param.sinceid = [[NSUserDefaults standardUserDefaults] objectForKey:@"seaAmoyLastID"];
    
    [PPSeaAmoyHTTP seaAmoyParameters:param success:^(PPSeaAmoyResult *result) {
        
        [self.tableView.mj_footer endRefreshing];
        
        NSArray *newData = result.data;
        
        [self.seaAmoyData addObjectsFromArray:newData];
        
        PPSeaAmoyData *lastData = [result.data lastObject];
        [[NSUserDefaults standardUserDefaults] setObject:lastData.ID forKey:@"seaAmoyLastID"];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - tableView数据源及代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.seaAmoyData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    PPSeaAmoyData *data = self.seaAmoyData[indexPath.row];
    
    cell.seaAmoyData = data;
    
    return cell;
}

@end
