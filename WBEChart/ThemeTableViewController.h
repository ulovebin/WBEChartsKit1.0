//
//  ThemeTableViewController.h
//  WBEChart
//
//  Created by WB on 17/4/20.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^WBThemeBlock)(NSString *theme);
@interface ThemeTableViewController : UITableViewController
@property(strong,readwrite,nonatomic)WBThemeBlock theme;
@end
