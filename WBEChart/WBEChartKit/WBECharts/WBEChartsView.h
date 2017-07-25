//
//  WBEChartsWebView.h
//  WBEChart
//
//  Created by WB on 17/3/28.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

typedef NS_ENUM(NSUInteger,WBChartsType)
{
    WBEChartPie=1,//饼状图
    WBEChartPieLegend, //带说明饼状图
    WBEChartBar,//柱状图
    WBEChartLine,//折线图
    WBEChartGauge,//仪表盘
    WBEChartRadar//雷达图
};

@protocol WBEChartsViewDelegate <NSObject>
@optional
-(void)wbEChartsViewCallBack:(nullable id)param;
@end


@interface WBEChartsView : WKWebView<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
- (nullable instancetype)initWithFrame:(CGRect)frame withChartData:(nullable id)param withType:(WBChartsType)type;
- (nonnull UIImage *)getCaptureImage;
@property (nonatomic,weak,nullable) id <WBEChartsViewDelegate> delegate;
@property(strong,nonnull,nonatomic)NSString *theme;
@end


@interface WBEChartsView(Gauge)//仪表盘

-(void)updataGaugeValue:(float)value;//仪表盘仪表盘更新数值

@end
#pragma mark 待扩展类别
@interface WBEChartsView(Pie)//饼状图

@end
@interface WBEChartsView(Bar)//柱状图

@end
@interface WBEChartsView(Line)//折线图

@end
@interface WBEChartsView(Radar)//雷达图

@end
