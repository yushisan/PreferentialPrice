//
//  PPDetailsCell.h
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPSelectionData;
@class PPSeaAmoyData;
@class PPHourChartData;
@class PPHotData;
@class PPSearchData;

@interface PPDetailsCell : UITableViewCell

@property (nonatomic, strong) PPSelectionData *selectionData;
@property (nonatomic, strong) PPSeaAmoyData *seaAmoyData;
@property (nonatomic, strong) PPHourChartData *hourChartData;
@property (nonatomic, strong) PPHotData *hotData;
@property (nonatomic, strong) PPSearchData *searchData;

@end
