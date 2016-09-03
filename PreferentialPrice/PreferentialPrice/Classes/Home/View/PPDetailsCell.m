//
//  PPDetailsCell.m
//  PreferentialPrice
//
//  Created by yeshaojian on 16/7/12.
//  Copyright © 2016年 yeshaojian. All rights reserved.
//

#import "PPDetailsCell.h"
#import "PPSelectionData.h"
#import "PPSeaAmoyData.h"
#import "PPHourChartData.h"
#import "PPHotData.h"
#import "PPSearchData.h"

@interface PPDetailsCell()

@property (weak, nonatomic) IBOutlet UIImageView *detailsImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *mall;
@property (weak, nonatomic) IBOutlet UILabel *subDetails;

@end

@implementation PPDetailsCell

- (void)setSelectionData:(PPSelectionData *)selectionData {
    
    _selectionData = selectionData;
    
    NSURL *url = [NSURL URLWithString:selectionData.image];
    [self.detailsImage sd_setImageWithURL:url placeholderImage:nil];
    
    self.title.text = selectionData.title;
    
    self.mall.text = selectionData.mall;
    
    self.subDetails.text = [NSString stringWithFormat:@"%@ · %@", selectionData.pubtime, selectionData.fromsite];
}

- (void)setSeaAmoyData:(PPSeaAmoyData *)seaAmoyData {
    
    _seaAmoyData = seaAmoyData;
    
    NSURL *url = [NSURL URLWithString:seaAmoyData.image];
    [self.detailsImage sd_setImageWithURL:url placeholderImage:nil];
    
    self.title.text = seaAmoyData.title;
    
    self.mall.text = seaAmoyData.mall;
    
    self.subDetails.text = [NSString stringWithFormat:@"%@ · %@", seaAmoyData.pubtime, seaAmoyData.fromsite];
}

- (void)setHourChartData:(PPHourChartData *)hourChartData {
    
    _hourChartData = hourChartData;
    
    NSURL *url = [NSURL URLWithString:hourChartData.image];
    [self.detailsImage sd_setImageWithURL:url placeholderImage:nil];
    
    self.title.text = hourChartData.title;
    
    self.mall.text = hourChartData.mall;
    
    self.subDetails.text = [NSString stringWithFormat:@"%@ · %@", hourChartData.pubtime, hourChartData.fromsite];
}

- (void)setHotData:(PPHotData *)hotData {
    
    _hotData = hotData;
    
    NSURL *url = [NSURL URLWithString:hotData.image];
    [self.detailsImage sd_setImageWithURL:url placeholderImage:nil];
    
    self.title.text = hotData.title;
    
}

- (void)setSearchData:(PPSearchData *)searchData {

    _searchData = searchData;
    
    NSURL *url = [NSURL URLWithString:searchData.image];
    [self.detailsImage sd_setImageWithURL:url placeholderImage:nil];
    
    self.title.text = searchData.title;
    
    self.mall.text = searchData.mall;
    
    self.subDetails.text = [NSString stringWithFormat:@"%@ · %@", searchData.pubtime, searchData.fromsite];
}

@end
