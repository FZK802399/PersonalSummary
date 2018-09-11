//
//  NJAwardInfoViewController.m
//  ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJAwardInfoViewController.h"
//#import "ILHtmlViewController.h"
//#import "ILNavigationController.h"

@interface NJAwardInfoViewController ()

@end

@implementation NJAwardInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"text-%d", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row%2) {
//        ILNavigationController *nav = [[ILNavigationController alloc] initWithRootViewController:[[ILHtmlViewController alloc] init]];
//        
//        [self presentViewController:nav animated:YES completion:nil];
//    } else {
//        [self.navigationController pushViewController:[[UIViewController alloc] init] animated:YES];
//    }
}

@end
