//
//  NJAwardPushViewController.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJAwardPushViewController.h"

@interface NJAwardPushViewController ()

@end

@implementation NJAwardPushViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"开奖推送设置";
    
    // 1.1.双色球
    NJSettingSwitchItem *ball = [NJSettingSwitchItem itemWithTitle:@"双色球"];
    ball.key = NJSettingAwardPushSSQ;
    
    // 1.2.大乐透
    NJSettingSwitchItem *letou = [NJSettingSwitchItem itemWithTitle:@"大乐透"];
    letou.key = NJSettingAwardPushDLT;
    
    NJSettingGroup *group = [NJSettingGroup groupWithItems:@[ball, letou]];
    group.header = @"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    [_allGroups addObject:group];
}
@end