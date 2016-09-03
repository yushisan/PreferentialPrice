//
//  PPSelectionController.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#define DataCount (@"30")

#import "PPSelectionController.h"
#import "PPSelectionHTTP.h"
#import "PPSelectionParames.h"
#import "PPSelectionData.h"
#import "PPDetailsCell.h"
#import <MJRefresh.h>

@interface PPSelectionController ()

@property (nonatomic, strong) NSMutableArray *selectedData;

@end

@implementation PPSelectionController

static NSString * const cellID = @"detailsCell";

- (NSMutableArray *)selectedData
{
    if (!_selectedData) {
        _selectedData = [NSMutableArray array];
    }
    return _selectedData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PPDetailsCell" bundle:nil] forCellReuseIdentifier:cellID];
    
    self.tableView.rowHeight = 120;
    
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
    
    PPSelectionParames *param = [[PPSelectionParames alloc] init];
    param.count = DataCount;
    
    [PPSelectionHTTP selectionParameters:param success:^(PPSelectionResult *result) {
        
        [self.tableView.mj_header endRefreshing];
        
        self.selectedData = result.data;
        
        // 保存数据中最后一个商品的ID
        PPSelectionData *lastData = [result.data lastObject];
        [[NSUserDefaults standardUserDefaults] setObject:lastData.ID forKey:@"SelectionLastID"];

        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)loadMoreData {
    
    PPSelectionParames *param = [[PPSelectionParames alloc] init];
    param.count = DataCount;
    param.sinceid = [[NSUserDefaults standardUserDefaults] objectForKey:@"SelectionLastID"];
    
    [PPSelectionHTTP selectionParameters:param success:^(PPSelectionResult *result) {
        
        [self.tableView.mj_footer endRefreshing];
        
        NSArray *newData = result.data;
        
        [self.selectedData addObjectsFromArray:newData];
        
        PPSelectionData *lastData = [result.data lastObject];
        [[NSUserDefaults standardUserDefaults] setObject:lastData.ID forKey:@"SelectionLastID"];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.selectedData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    PPSelectionData *data = self.selectedData[indexPath.row];
    cell.selectionData = data;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self loadMoreData];
}

@end
