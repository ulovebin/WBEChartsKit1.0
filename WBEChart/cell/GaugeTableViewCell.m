//
//  GaugeTableViewCell.m
//  WBEChart
//
//  Created by WB on 17/4/19.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import "GaugeTableViewCell.h"
#import "WBEChartsHeader.h"
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width
@interface GaugeTableViewCell()<WBEChartsViewDelegate>
{
    WBEChartsView *webView;

}

@end
@implementation GaugeTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
#pragma mark 仪表盘
        NSDictionary *dataDic1=[NSDictionary dictionaryWithObjectsAndKeys:@"30",@"value",@"完成率",@"name", nil];
        NSMutableArray *dataArr1=[NSMutableArray arrayWithObjects:dataDic1, nil];
        NSArray *colorArr=[NSArray arrayWithObjects:@0.2,@"#228b22" ,nil];
        NSArray *colorArr1=[NSArray arrayWithObjects:@0.8,@"#48b" ,nil];
        NSArray *colorArr2=[NSArray arrayWithObjects:@1,@"#ff4500" ,nil];
        NSMutableArray *dataArr2=[NSMutableArray arrayWithObjects:colorArr,colorArr1,colorArr2, nil];
        WBEChartGaugeModel *model=[[WBEChartGaugeModel alloc]init];
        model.tooltipFormatter=@"{a} <br/>{b} : {c}%";
        model.seriesName=@"测试表盘";
        model.seriesMin=@"0";
        model.seriesMax=@"100";
        model.seriessplitNumber=@"5";
        model.seriesData=dataArr1;
        model.seriesAxisLineWidth=@"10";
        model.seriesSplitLineLength=@"15";
        model.seriesTitleFontSize=@"15";
        model.seriesDetailFontSize=@"15";
        model.seriesaxisLabelFontSize=@"12";
        model.seriesDetailFormatter=@"{value}%";
        model.seriesAxisLineColor=dataArr2;
        
        if (!webView) {
            webView=[[WBEChartsView alloc]initWithFrame:CGRectMake(ScreenWidth/4, 0, ScreenWidth/2,ScreenWidth/2) withChartData:model withType:WBEChartGauge];
            webView.delegate=self;
            webView.tag=10010;
            [self.contentView addSubview:webView];

        }
        
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-100, 10, 50, 25)];
        [button setTitle:@"刷新" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(updataData) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=[UIColor orangeColor];
        button.layer.cornerRadius=5;
        button.layer.masksToBounds=YES;
        [self.contentView addSubview:button];
        
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

-(void)updataData
{
     [webView updataGaugeValue:(float)(0 + (arc4random() % (100-0 + 1)))];
}
-(void)wbEChartsViewCallBack:(nullable id)param
{
    
    NSLog(@"JS调用传回参数 %@",param);
    
}

@end
