//
//  WBEChartsModel.h
//  WBEChart
//
//  Created by WB on 17/3/30.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBEChartsModel : NSObject

@end
@interface WBEChartPieModel : NSObject


@property(strong,readwrite,nonatomic)NSString *tooltipFormatter;//提示窗格式

@property(strong,readwrite,nonatomic)NSString *legendFontSize;//图例字体
@property(strong,readwrite,nonatomic)NSString *legendX;//图例水平位置
@property(strong,readwrite,nonatomic)NSString *legendY;//图例垂直位置
@property(strong,readwrite,nonatomic)NSString *legendOrient;//图例方向
@property(strong,readwrite,nonatomic)NSString *legenditemWidth;//图例图形宽度
@property(strong,readwrite,nonatomic)NSString *legenditemHeight;//图例图形高度
@property(strong,readwrite,nonatomic)NSString *legenditemGap;//图例间隔

@property(strong,readwrite,nonatomic)NSArray *seriesData;//数据
@property(strong,readwrite,nonatomic)NSString *seriesRadius;//饼状图半径
@property(strong,readwrite,nonatomic)NSArray *seriesCenter;//中心位置
@property(strong,readwrite,nonatomic)NSString *seriesName;//图表名字
@property(strong,readwrite,nonatomic)NSString *seriesFormatter;//线字格式
@property(strong,readwrite,nonatomic)NSString *seriesFontSize;//线字大小

@property(strong,readwrite,nonatomic)NSString *animation;//是否动画

@property(strong,readwrite,nonatomic)NSString *lablePosition;//lable显示在内部还是外部
@property(strong,readwrite,nonatomic)NSString *lableLineLength;//lable线长

@property(strong,readwrite,nonatomic)NSString *chartTheme;//主题可设置：  dark  blue  gray  green  helianthus  infographic  macarons  macarons2  mint  red  roma  sakura  shine

//饼图formatter: a（系列名称），b（数据项名称），c（数值）, d（饼图：百分比 ）  {a} <br/>{b} : {c} ({d}%)
@end


@interface WBEChartBarModel : NSObject

@property(strong,readwrite,nonatomic)NSString *tooltipFormatter;//提示窗格式
//seriesData只有一条数据时有效

@property(strong,readwrite,nonatomic)NSString *legendFontSize;//图例字体
@property(strong,readwrite,nonatomic)NSString *legendX;//图例水平位置
@property(strong,readwrite,nonatomic)NSString *legendY;//图例垂直位置
@property(strong,readwrite,nonatomic)NSString *legendOrient;//图例方向
@property(strong,readwrite,nonatomic)NSString *legenditemWidth;//图例图形宽度
@property(strong,readwrite,nonatomic)NSString *legenditemHeight;//图例图形高度
@property(strong,readwrite,nonatomic)NSString *legenditemGap;//图例间隔
@property(strong,readwrite,nonatomic)NSArray *legendData;//图例数据

@property(strong,readwrite,nonatomic)NSArray *xAxisData;//x轴数据
@property(strong,readwrite,nonatomic)NSString *yAxisFormatter;//Y轴数据格式

@property(strong,readwrite,nonatomic)NSArray *seriesData;//数据
@property(strong,readwrite,nonatomic)NSString *seriesMax;//最大值
@property(strong,readwrite,nonatomic)NSString *seriesMin;//最小值
@property(strong,readwrite,nonatomic)NSString *seriesAverage;//平均线

@property(strong,readwrite,nonatomic)NSString *chartTheme;//主题可设置：  dark  blue  gray  green  helianthus  infographic  macarons  macarons2  mint  red  roma  sakura  shine

//柱状图formatter:a（系列名称），b（类目值），c（数值）, d（无）
@end


@interface WBEChartLineModel : NSObject

@property(strong,readwrite,nonatomic)NSString *tooltipFormatter;//提示窗格式
//seriesData只有一条数据时有效

@property(strong,readwrite,nonatomic)NSString *legendFontSize;//图例字体
@property(strong,readwrite,nonatomic)NSString *legendX;//图例水平位置
@property(strong,readwrite,nonatomic)NSString *legendY;//图例垂直位置
@property(strong,readwrite,nonatomic)NSString *legendOrient;//图例方向
@property(strong,readwrite,nonatomic)NSString *legenditemWidth;//图例图形宽度
@property(strong,readwrite,nonatomic)NSString *legenditemHeight;//图例图形高度
@property(strong,readwrite,nonatomic)NSString *legenditemGap;//图例间隔
@property(strong,readwrite,nonatomic)NSArray *legendData;//图例数据

@property(strong,readwrite,nonatomic)NSArray *xAxisData;//x轴数据
@property(strong,readwrite,nonatomic)NSString *yAxisFormatter;//Y轴数据格式

@property(strong,readwrite,nonatomic)NSArray *seriesData;//数据
@property(strong,readwrite,nonatomic)NSString *seriesMax;//最大值
@property(strong,readwrite,nonatomic)NSString *seriesMin;//最小值
@property(strong,readwrite,nonatomic)NSString *seriesAverage;//平均线
@property(strong,readwrite,nonatomic)NSString *seriesAreaFill;//填充

@property(strong,readwrite,nonatomic)NSString *chartTheme;//主题可设置：  dark  blue  gray  green  helianthus  infographic  macarons  macarons2  mint  red  roma  sakura  shine

//折线图formatter:a（系列名称），b（类目值），c（数值）, d（无）
@end


@interface WBEChartGaugeModel : NSObject
@property(strong,readwrite,nonatomic)NSString *tooltipFormatter;//提示窗格式

@property(strong,readwrite,nonatomic)NSString *seriesName;//仪表盘名字
@property(strong,readwrite,nonatomic)NSString *seriesMin;//仪表盘最小值
@property(strong,readwrite,nonatomic)NSString *seriesMax;//仪表盘最大值
@property(strong,readwrite,nonatomic)NSString *seriessplitNumber;//仪表盘刻度分割数
@property(strong,readwrite,nonatomic)NSMutableArray *seriesData;//仪表盘指示数据
@property(strong,readwrite,nonatomic)NSString *seriesAxisLineWidth;//仪表盘宽度
@property(strong,readwrite,nonatomic)NSString *seriesSplitLineLength;//仪表盘刻度线长度
@property(strong,readwrite,nonatomic)NSString *seriesTitleFontSize;//仪表盘标题字体
@property(strong,readwrite,nonatomic)NSString *seriesDetailFontSize;//仪表盘详情字体
@property(strong,readwrite,nonatomic)NSString *seriesaxisLabelFontSize;//仪表盘数值字体
@property(strong,readwrite,nonatomic)NSString *seriesDetailFormatter;//仪表盘详情格式
@property(strong,readwrite,nonatomic)NSMutableArray *seriesAxisLineColor;//仪表盘颜色

@property(strong,readwrite,nonatomic)NSString *chartTheme;//主题可设置：  dark  blue  gray  green  helianthus  infographic  macarons  macarons2  mint  red  roma  sakura  shine

//仪表盘Formatter:a（系列名称），b（数据项名称），c（数值), d（无)
@end



@interface WBEChartRadarModel : NSObject
@property(strong,readwrite,nonatomic)NSString *legendFontSize;//图例字体
@property(strong,readwrite,nonatomic)NSString *legendX;//图例水平位置
@property(strong,readwrite,nonatomic)NSString *legendY;//图例垂直位置
@property(strong,readwrite,nonatomic)NSString *legendOrient;//图例方向
@property(strong,readwrite,nonatomic)NSString *legenditemWidth;//图例图形宽度
@property(strong,readwrite,nonatomic)NSString *legenditemHeight;//图例图形高度
@property(strong,readwrite,nonatomic)NSString *legenditemGap;//图例间隔
@property(strong,readwrite,nonatomic)NSArray *legendData;//图例数据

@property(strong,readwrite,nonatomic)NSArray *polarData;//最大值数据

@property(strong,readwrite,nonatomic)NSString *seriesAreaFill;//填充
@property(strong,readwrite,nonatomic)NSArray *seriesData;//数据
@property(strong,readwrite,nonatomic)NSString *seriesNameColor;//坐标值颜色
@property(strong,readwrite,nonatomic)NSString *seriesNameFont;//坐标值字体

@property(strong,readwrite,nonatomic)NSString *chartTheme;//主题可设置：  dark  blue  gray  green  helianthus  infographic  macarons  macarons2  mint  red  roma  sakura  shine

@end
