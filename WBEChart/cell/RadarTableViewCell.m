//
//  RadarTableViewCell.m
//  WBEChart
//
//  Created by WB on 17/4/19.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import "RadarTableViewCell.h"
#import "WBEChartsHeader.h"
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width
@interface RadarTableViewCell()<WBEChartsViewDelegate>
{
    
}

@end
@implementation RadarTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
#pragma mark 雷达图
        NSMutableArray *dataArr1=[NSMutableArray arrayWithObjects:@"罗纳尔多",@"舍普琴科", nil];
        NSDictionary *dataDic1=[NSDictionary dictionaryWithObjectsAndKeys:@"进攻",@"text",@100,@"max", nil];
        NSDictionary *dataDic2=[NSDictionary dictionaryWithObjectsAndKeys:@"防守",@"text",@100,@"max", nil];
        NSDictionary *dataDic3=[NSDictionary dictionaryWithObjectsAndKeys:@"体能",@"text",@100,@"max", nil];
        NSDictionary *dataDic4=[NSDictionary dictionaryWithObjectsAndKeys:@"速度",@"text",@100,@"max", nil];
        NSDictionary *dataDic5=[NSDictionary dictionaryWithObjectsAndKeys:@"力量",@"text",@100,@"max", nil];
        NSDictionary *dataDic6=[NSDictionary dictionaryWithObjectsAndKeys:@"技巧",@"text",@100,@"max", nil];
        NSMutableArray *dataArr61=[NSMutableArray arrayWithObjects:dataDic1,dataDic2,dataDic3,dataDic4,dataDic5,dataDic6, nil];
        NSDictionary *dataDic7=[NSDictionary dictionaryWithObjectsAndKeys:@[@97, @42, @88, @94, @90, @86],@"value",@"舍普琴科",@"name", nil];
        NSDictionary *dataDic8=[NSDictionary dictionaryWithObjectsAndKeys:@[@97, @32, @74, @95, @88, @92],@"value",@"罗纳尔多",@"name", nil];
        NSMutableArray *dataArr9=[NSMutableArray arrayWithObjects:dataDic7,dataDic8, nil];
        WBEChartRadarModel *model=[[WBEChartRadarModel alloc]init];
        model.legendFontSize=@"16";
        model.legendX=@"center";
        model.legendY=@"top";
        model.legenditemWidth=@"20";
        model.legenditemHeight=@"14";
        model.legenditemGap=@"10";
        model.legendOrient=@"horizontal";
        model.legendData=dataArr1;
        model.polarData=dataArr61;
        model.seriesAreaFill=@"yes";
        model.seriesData=dataArr9;
        model.seriesNameColor=@"#333";
        model.seriesNameFont=@"15";
        
        
        WBEChartsView *webView=[[WBEChartsView alloc]initWithFrame:CGRectMake(ScreenWidth/4, 0, ScreenWidth/2,ScreenWidth/2) withChartData:model withType:WBEChartRadar];
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
