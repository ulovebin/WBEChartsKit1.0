//
//  ViewController.m
//  WBEChart
//
//  Created by WB on 17/3/28.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "WBEChartsHeader.h"
#import "PieTableViewCell.h"
#import "BarTableViewCell.h"
#import "LineTableViewCell.h"
#import "GaugeTableViewCell.h"
#import "RadarTableViewCell.h"
#import "ThemeTableViewController.h"

@interface ViewController()
{
    ThemeTableViewController *_themeTableVC;
    NSString *_theme;
    //ceshi123
}

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"WBEChartsKit";
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"主题" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedThemeBtn:event:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.frame),  CGRectGetHeight(self.view.frame))];
    [_tableView registerClass:[PieTableViewCell class] forCellReuseIdentifier:@"PieTableViewCell"];
    [_tableView registerClass:[PieTableViewCell class] forCellReuseIdentifier:@"PieLegendTableViewCell"];
    [_tableView registerClass:[BarTableViewCell class] forCellReuseIdentifier:@"BarTableViewCell"];
    [_tableView registerClass:[LineTableViewCell class] forCellReuseIdentifier:@"LineTableViewCell"];
    [_tableView registerClass:[GaugeTableViewCell class] forCellReuseIdentifier:@"GaugeTableViewCell"];
    [_tableView registerClass:[RadarTableViewCell class] forCellReuseIdentifier:@"RadarTableViewCell"];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}
- (void)onClickedThemeBtn:(UIButton *)btn event:(UIEvent *) event {
    
    if (!_themeTableVC) {
        _themeTableVC = [[ThemeTableViewController alloc] init];
        _themeTableVC.preferredContentSize = CGSizeMake(120, 200);
        _themeTableVC.modalPresentationStyle = UIModalPresentationPopover;
        __weak typeof (self) weakSelf = self;
        _themeTableVC.theme=^(NSString *theme){
            
            _theme=theme;
            [weakSelf.tableView reloadData];
            
        };
    }
    UIPopoverPresentationController *popoverPresentationController= _themeTableVC.popoverPresentationController;
    popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    [self presentViewController:_themeTableVC animated:YES completion:nil];
    
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PieTableViewCell" forIndexPath:indexPath];

        [self setThemeWith:cell];
        return cell;
        
    }
    else if (indexPath.section==1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PieLegendTableViewCell" forIndexPath:indexPath];
        [self setThemeWith:cell];
        return cell;
    }
    else if (indexPath.section==2)
    {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BarTableViewCell" forIndexPath:indexPath];
        [self setThemeWith:cell];
        return cell;
    }
    else if (indexPath.section==3)
    {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LineTableViewCell" forIndexPath:indexPath];
        [self setThemeWith:cell];
        return cell;
    }
    else if (indexPath.section==4)
    {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GaugeTableViewCell" forIndexPath:indexPath];
        [self setThemeWith:cell];
        return cell;
    }
    else if (indexPath.section==5)
    {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RadarTableViewCell" forIndexPath:indexPath];
        [self setThemeWith:cell];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PieTableViewCell" forIndexPath:indexPath];
    [self setThemeWith:cell];
    
    
    return cell;
    
}
-(void)setThemeWith:(UITableViewCell *)cell
{
    if (_theme) {
        WBEChartsView *webView =[cell.contentView viewWithTag:10010];
        [webView setTheme:_theme];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"饼图";
    } else if (section == 1) {
        return @"图例饼图";
    } else if (section == 2) {
        return @"柱状图";
    } else if (section == 3) {
        return @"折线图";
    }else if (section == 4) {
        return @"仪表盘";
    }else {
        return @"雷达图";
    }
}

//返回索引数组
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return @[@"饼",@"图例饼",@"柱状",@"折线",@"仪表盘",@"雷达图"];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == 0) {
        return self.view.frame.size.width/2;
    } else if ([indexPath section] == 1) {
        return self.view.frame.size.width/2;
    } else if ([indexPath section] == 2) {
       return self.view.frame.size.width/2;
    } else if ([indexPath section] == 3) {
        return self.view.frame.size.width/2;
    }else if ([indexPath section] == 4) {
        return self.view.frame.size.width/2;
    }else {
        return self.view.frame.size.width/2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}


@end
