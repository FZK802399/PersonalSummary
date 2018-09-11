//
//  ILBuyTimedNoticeViewController.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-24.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "NJBuyTimedNoticeViewController.h"

@interface NJBuyTimedNoticeViewController ()

@end

@implementation NJBuyTimedNoticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"提醒设置";
    
    NJSettingSwitchItem *notice = [NJSettingSwitchItem itemWithTitle:@"打开提醒"];
    notice.key = NJSettingBuyTimedNotice;
    
    NJSettingGroup *group = [NJSettingGroup groupWithItems:@[notice]];
    group.header = @"您可以通过设置，提醒自己在开奖日不要忘了购买彩票";
    [_allGroups addObject:group];
}

@end
