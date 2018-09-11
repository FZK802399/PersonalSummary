//
//  NJAboutViewController.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJAboutViewController.h"
#import "NJAboutHeaderView.h"

@interface NJAboutViewController ()

@end

@implementation NJAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"关于";
    
    // 1.1 评分支持
    NJSettingArrowItem *mark = [NJSettingArrowItem itemWithTitle:@"评分支持"];
    
    // 1.2 客服电话
    NJSettingArrowItem *phone = [NJSettingArrowItem itemWithTitle:@"客服电话"];
    phone.subtitle = @"020-83568090";
    
    NJSettingGroup *group = [NJSettingGroup groupWithItems:@[mark, phone]];
    [_allGroups addObject:group];
    
    // 2.设置表格的头部控件
    self.tableView.tableHeaderView = [NJAboutHeaderView headerView];
//    self.tableView.scrollEnabled = NO;
}

@end
