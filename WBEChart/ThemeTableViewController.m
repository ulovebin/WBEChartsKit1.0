//
//  ThemeTableViewController.m
//  WBEChart
//
//  Created by WB on 17/4/20.
//  Copyright © 2017年 qmap. All rights reserved.
//

#import "ThemeTableViewController.h"

@interface ThemeTableViewController ()
{
    NSArray *_rowTittleArr;

}
@end

@implementation ThemeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 _rowTittleArr=@[@"dark",@"blue",@"gray",@"green",@"helianthus",@"infographic",@"macarons",@"macarons2",@"mint",@"red",@"roma",@"sakura",@"shine"];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _rowTittleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"themecell"];
    if (cell==nil) {
         cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"themecell"];
    }
    cell.textLabel.text=[_rowTittleArr objectAtIndex:[indexPath row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    self.theme([_rowTittleArr objectAtIndex:[indexPath row]]);
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}


@end
