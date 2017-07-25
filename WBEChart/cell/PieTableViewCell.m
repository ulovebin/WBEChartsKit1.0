//
//  PieTableViewCell.m
//  WBEChart
//
//  Created by WB on 17/4/19.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import "PieTableViewCell.h"
#import "WBEChartsHeader.h"
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width
@interface PieTableViewCell()<WBEChartsViewDelegate>
{

    WBEChartsView *webView;
    UIImageView *imageView;
}

@end

@implementation PieTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        if ([reuseIdentifier isEqualToString:@"PieTableViewCell"]) {
#pragma mark 饼状图
            NSMutableDictionary *dataDic1=[NSMutableDictionary dictionary];
            [dataDic1 setValue:@"335" forKey:@"value"];
            [dataDic1 setValue:@"直接访问" forKey:@"name"];
            
            NSMutableDictionary *dataDic2=[NSMutableDictionary dictionary];
            [dataDic2 setValue:@"335" forKey:@"value"];
            [dataDic2 setValue:@"邮件营销" forKey:@"name"];
            
            NSMutableDictionary *dataDic3=[NSMutableDictionary dictionary];
            [dataDic3 setValue:@"335" forKey:@"value"];
            [dataDic3 setValue:@"联盟广告" forKey:@"name"];
            
            NSMutableDictionary *dataDic4=[NSMutableDictionary dictionary];
            [dataDic4 setValue:@"335" forKey:@"value"];
            [dataDic4 setValue:@"视频广告" forKey:@"name"];
            
            NSMutableDictionary *dataDic5=[NSMutableDictionary dictionary];
            [dataDic5 setValue:@"335" forKey:@"value"];
            [dataDic5 setValue:@"搜索引擎" forKey:@"name"];
            
            NSMutableArray *dataArr=[NSMutableArray array];
            [dataArr addObject:dataDic1];
            [dataArr addObject:dataDic2];
            [dataArr addObject:dataDic3];
            [dataArr addObject:dataDic4];
            [dataArr addObject:dataDic5];
            
            WBEChartPieModel *model=[[WBEChartPieModel alloc]init];
            model.seriesData=dataArr;
            model.tooltipFormatter=@"{a} <br/>{b} : {c} ({d}%)";
            model.seriesFormatter=@"{b} :({d}%)";
            model.seriesRadius=@"70%";
            model.seriesCenter=@[@"50%",@"50%"];
            model.seriesName=@"测试";
            model.seriesFontSize=@"7";
            model.lablePosition=@"inner";
            if (!webView) {
                webView=[[WBEChartsView alloc]initWithFrame:CGRectMake(ScreenWidth/4, 0, ScreenWidth/2,ScreenWidth/2) withChartData:model withType:WBEChartPie];
                
                webView.delegate=self;
                webView.tag=10010;
                [self.contentView addSubview:webView];
            }
            

            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-100, 10, 50, 25)];
            [button setTitle:@"截图" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(screenCapture) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor=[UIColor orangeColor];
            button.layer.cornerRadius=5;
            button.layer.masksToBounds=YES;
            [self.contentView addSubview:button];
            
            
        }
        else if ([reuseIdentifier isEqualToString:@"PieLegendTableViewCell"])
        {
#pragma mark 带图例饼状图
            NSMutableDictionary *dataDic1=[NSMutableDictionary dictionary];
            [dataDic1 setValue:@"335" forKey:@"value"];
            [dataDic1 setValue:@"人口总量" forKey:@"name"];
            
            NSMutableDictionary *dataDic2=[NSMutableDictionary dictionary];
            [dataDic2 setValue:@"100" forKey:@"value"];
            [dataDic2 setValue:@"外来人口" forKey:@"name"];
            
            NSMutableDictionary *dataDic3=[NSMutableDictionary dictionary];
            [dataDic3 setValue:@"240" forKey:@"value"];
            [dataDic3 setValue:@"常住人口" forKey:@"name"];
            
            NSMutableDictionary *dataDic4=[NSMutableDictionary dictionary];
            [dataDic4 setValue:@"90" forKey:@"value"];
            [dataDic4 setValue:@"租户数量" forKey:@"name"];
            
            NSMutableArray *dataArr=[NSMutableArray array];
            [dataArr addObject:dataDic1];
            [dataArr addObject:dataDic2];
            [dataArr addObject:dataDic3];
            [dataArr addObject:dataDic4];
            
            WBEChartPieModel *model=[[WBEChartPieModel alloc]init];
            model.seriesData=dataArr;
            model.tooltipFormatter=@"{a} <br/>{b} : {c} ({d}%)";
            model.legendFontSize=@"13";
            model.legendX=@"center";
            model.legendY=@"top";
            model.legenditemWidth=@"20";
            model.legenditemHeight=@"14";
            model.legenditemGap=@"10";
            model.legendOrient=@"horizontal";
            model.seriesFormatter=@"{b}";
            model.seriesRadius=@"40%";
            model.seriesCenter=@[@"50%",@"50%"];
            model.seriesName=@"测试";
            model.seriesFontSize=@"12";
            model.animation=@"true";
            model.lablePosition=@"outter";
            model.lableLineLength=@"10";
            
            //带说明
            WBEChartsView *webView1=[[WBEChartsView alloc]initWithFrame:CGRectMake(ScreenWidth/4, 0, ScreenWidth/2,ScreenWidth/2) withChartData:model withType:WBEChartPieLegend];
            webView1.delegate=self;
            webView1.tag=10010;
            [self.contentView addSubview:webView1];
            
        }
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return self;
}
-(void)screenCapture
{
    imageView=[[UIImageView alloc]initWithFrame:webView.frame];
    imageView.image=[webView getCaptureImage];
    [self addSubview:imageView];
    
    [UIView animateWithDuration:1 animations:^{
        imageView.frame=CGRectMake(-ScreenWidth/2, 0, ScreenWidth/2,ScreenWidth/2);
        
    }];

}
-(void)wbEChartsViewCallBack:(nullable id)param
{
    
    NSLog(@"JS调用传回参数 %@",param);
    
}

@end
