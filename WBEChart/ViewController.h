//
//  ViewController.h
//  WBEChart
//
//  Created by WB on 17/3/28.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIPopoverControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@end

