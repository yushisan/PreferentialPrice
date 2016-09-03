//
//  PPHourChartController.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPHourChartController.h"
#import "PPDetailsCell.h"
#import "PPHourChartHTTP.h"
#import "PPHourChartParams.h"
#import "PPHourChartResult.h"
#import "PPHourChartData.h"
#import <MJRefresh.h>

@interface PPHourChartController ()

@property (nonatomic, strong) NSArray *hourChartData;

@end

@implementation PPHourChartController

static NSString * const cellID = @"detailsCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 120;
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"PPDetailsCell" bundle:nil] forCellReuseIdentifier:cellID];
    
    // 添加下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.tableView.mj_header beginRefreshing];
    
}

/**
 *  加载最新数据
 */
- (void)loadData {
    
    [PPHourChartHTTP hourChartParameters:nil success:^(PPHourChartResult *result) {
        
        [self.tableView.mj_header endRefreshing];
        
        self.hourChartData = result.data;
        
        // 保存当前时间段
        [[NSUserDefaults standardUserDefaults] setObject:result.lasthourdate forKey:@"seaAmoyLastTime"];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
    
}

#pragma mark - tableView数据源及代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.hourChartData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    PPHourChartData *data = self.hourChartData[indexPath.row];
    
    cell.hourChartData = data;
    
    return cell;
}

@end
