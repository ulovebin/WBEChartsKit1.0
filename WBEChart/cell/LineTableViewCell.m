//
//  LineTableViewCell.m
//  WBEChart
//
//  Created by WB on 17/4/19.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import "LineTableViewCell.h"
#import "WBEChartsHeader.h"
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width
@interface LineTableViewCell()<WBEChartsViewDelegate>


@end
@implementation LineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        

#pragma mark 折线图
        NSMutableArray *dataArr1=[NSMutableArray arrayWithObjects:@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日", nil];
        NSMutableArray *dataArr2=[NSMutableArray arrayWithObjects:@"最高气温",@"最低气温", nil];
        NSMutableArray *dataArr3=[NSMutableArray arrayWithObjects:@11, @11, @15, @13, @12, @13, @10, nil];
        NSMutableArray *dataArr4=[NSMutableArray arrayWithObjects:@1, @(-2), @2, @5, @3, @2, @0, nil];
        NSMutableArray *dataArr5=[NSMutableArray arrayWithObjects:dataArr4,dataArr3, nil];
        WBEChartLineModel *model=[[WBEChartLineModel alloc]init];
        //    model4.tooltipFormatter=@"{a} <br/>{b} : {c}";
        model.legendFontSize=@"13";
        model.legendX=@"center";
        model.legendY=@"top";
        model.legenditemWidth=@"20";
        model.legenditemHeight=@"14";
        model.legenditemGap=@"10";
        model.legendOrient=@"horizontal";
        model.legendData=dataArr2;
        model.xAxisData=dataArr1;
        model.yAxisFormatter=@"{value} °C";
        model.seriesData=dataArr5;
        model.seriesMax=@"max";
        model.seriesMin=@"min";
        model.seriesAverage=@"average";
        model.seriesAreaFill=@"no";
        
        WBEChartsView *webView=[[WBEChartsView alloc]initWithFrame:CGRectMake(ScreenWidth/4.5, 0, ScreenWidth/1.5,ScreenWidth/2) withChartData:model withType:WBEChartLine];
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
