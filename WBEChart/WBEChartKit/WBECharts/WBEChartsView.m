//
//  WBEChartsWebView.m
//  WBEChart
//
//  Created by WB on 17/3/28.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import "WBEChartsView.h"
#import "WBEChartsModel.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface WBEChartsView ()
{
    WBChartsType chartType;
    
    NSMutableDictionary *object;
    
    NSString *h5Path;
}
@end

@implementation WBEChartsView

- (instancetype)initWithFrame:(CGRect)frame withChartData:(id)param withType:(WBChartsType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self->chartType=type;
        
        [self dealModelWith:param];
    
        NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
        NSString * htmlPath = [[NSBundle mainBundle] pathForResource:self->h5Path
                                                              ofType:@"html"];
        NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                        encoding:NSUTF8StringEncoding
              
                                                             error:nil];
        self.navigationDelegate = self;
        self.UIDelegate=self;
        self.scrollView.scrollEnabled=NO;
        [self loadHTMLString:htmlCont baseURL:baseURL];
        
        [self configuration].userContentController = [[WKUserContentController alloc] init];
        [[self configuration].userContentController addScriptMessageHandler:self name:@"paramCall"];

    }
    return self;
}


#pragma mark -数据处理
-(void)dealModelWith:(id)modelData
{
    self->object = objc_msgSend(objc_msgSend( objc_getClass("NSMutableDictionary"), @selector(alloc)), @selector(init));
    u_int count = 0;
    objc_property_t *properties = class_copyPropertyList([modelData class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *propertyCString = property_getName(property);
        NSString *propertyName = [NSString stringWithCString:propertyCString encoding:NSUTF8StringEncoding];
        
        if ([modelData valueForKey:propertyName]) {
            ((void (*) (id, SEL, NSString *,NSString *)) objc_msgSend) (self->object, @selector(setValue:forKey:),[modelData valueForKey:propertyName],propertyName);
        }
    }
    free(properties);
    
    NSArray *pathArr=@[@"",@"WBEChartPie",@"WBEChartPie",@"WBEChartBar",@"WBEChartLine",@"WBEChartGauge",@"WBEChartRadar"];
    self->h5Path=pathArr[self->chartType];
    
}

#pragma mark -web代理

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSData *data=[NSJSONSerialization dataWithJSONObject:self->object options:NSJSONWritingPrettyPrinted error:nil];
    NSString *dataJson=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSString *dataFunc=[NSString stringWithFormat:@"generalChart(%@,%lu)",dataJson,(unsigned long)self->chartType];
    
    [self evaluateJavaScript:dataFunc completionHandler:^(id _Nullable param, NSError * _Nullable error) {
        
    }];
    if (self.theme) {
        [self setTheme:_theme];
    }
}
//web回调
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSLog(@"JS 调用了 %@ 方法，传回参数 %@",message.name,message.body);
    NSMutableDictionary *dic=[message.body objectForKey:@"body"];
    if ([_delegate respondsToSelector:@selector(wbEChartsViewCallBack:)]) {
        [_delegate wbEChartsViewCallBack:dic];
    }
}
#pragma mark -功能

//设置主题
-(void)setTheme:(NSString *)theme
{
    NSString *dataFunc=[NSString stringWithFormat:@"setTheme(%@)",theme];
    [self evaluateJavaScript:dataFunc completionHandler:^(id _Nullable param, NSError * _Nullable error) {
        if (error) {
            _theme=theme;
        }
        else
        {
            _theme=nil;
        }
    }];
}

//截图
- (UIImage *)getCaptureImage {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, true, 0);
    for (UIView *subview in self.subviews) {
        [subview drawViewHierarchyInRect:subview.bounds afterScreenUpdates:YES];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

#pragma mark 可扩展
@implementation WBEChartsView (Gauge)

//仪表盘更新
-(void)updataGaugeValue:(float)value
{
    NSString *dataFunc=[NSString stringWithFormat:@"updataGaugeValue(%f)",value];
    
    [self evaluateJavaScript:dataFunc completionHandler:^(id _Nullable param, NSError * _Nullable error) {
        
    }];
}
@end

@implementation WBEChartsView (Pie)


@end
@implementation WBEChartsView (Bar)


@end
@implementation WBEChartsView (Line)


@end
@implementation WBEChartsView (Radar)


@end
