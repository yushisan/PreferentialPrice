//
//  PPHotController.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/23.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPHotController.h"
#import "PPHotParams.h"
#import "PPHotResult.h"
#import "PPHotHTTP.h"
#import "PPDetailsCell.h"

@interface PPHotController ()

@property (nonatomic, strong) NSArray *hotData;

@end

@implementation PPHotController

static NSString * const cellID = @"detailsCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 120;
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"PPDetailsCell" bundle:nil] forCellReuseIdentifier:cellID];
    
    // 加载数据
    [self loadData];
}

- (void)loadData {
    
    [PPHotHTTP hotWithParameters:nil success:^(PPHotResult *result) {
        
        self.hotData = result.data;
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.hotData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    PPDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    PPHotData *data = self.hotData[indexPath.row];
    
    cell.hotData = data;
    
    return cell;
}

@end
