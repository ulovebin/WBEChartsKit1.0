//
//  BarTableViewCell.m
//  WBEChart
//
//  Created by WB on 17/4/19.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import "BarTableViewCell.h"
#import "WBEChartsHeader.h"
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width
@interface BarTableViewCell()<WBEChartsViewDelegate>


@end
@implementation BarTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
#pragma mark 柱状图
        NSMutableArray *dataArr1=[NSMutableArray arrayWithObjects:@"蒸发量",@"降水量",@"存储量", nil];
        NSMutableArray *dataArr2=[NSMutableArray arrayWithObjects:@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月", nil];
        NSMutableArray *dataArr3=[NSMutableArray arrayWithObjects:@2.0, @4.9, @7.0, @23.2, @25.6, @76.7, @135.6, @162.2, @32.6, @20.0, @6.4, @3.3, nil];
        NSMutableArray *dataArr4=[NSMutableArray arrayWithObjects:@2.6, @5.9, @9.0, @26.4, @28.7, @70.7, @175.6, @182.2, @48.7, @18.8, @6.0, @2.3, nil];
        NSMutableArray *dataArr5=[NSMutableArray arrayWithObjects:@11.6, @124.9, @39.0, @162, @140.7, @60.7, @145.6, @62.2, @58.7, @120.8, @36.0, @32.3, nil];
        NSMutableArray *dataArr6=[NSMutableArray arrayWithObjects:dataArr3,dataArr4,dataArr5, nil];
        WBEChartBarModel *model=[[WBEChartBarModel alloc]init];
        model.xAxisData=dataArr2;
        model.yAxisFormatter=@"{value}";
        //    model3.tooltipFormatter=@"{a} <br/>{b} : {c}";
        model.legendFontSize=@"13";
        model.legendX=@"center";
        model.legendY=@"top";
        model.legenditemWidth=@"20";
        model.legenditemHeight=@"14";
        model.legenditemGap=@"10";
        model.legendOrient=@"horizontal";
        model.legendData=dataArr1;
        model.seriesData=dataArr6;
        model.seriesMax=@"max";
        model.seriesMin=@"min";
        model.seriesAverage=@"average";
        
        WBEChartsView *webView=[[WBEChartsView alloc]initWithFrame:CGRectMake(ScreenWidth/4.5, 0, ScreenWidth/1.5,ScreenWidth/2) withChartData:model withType:WBEChartBar];
        webView.delegate=self;
        webView.tag=10010;
        [self.contentView addSubview:webView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return self;
}
-(void)wbEChartsViewCallBack:(nullable id)param
{
    
    NSLog(@"JS调用传回参数 %@",param);
    
}

@end
