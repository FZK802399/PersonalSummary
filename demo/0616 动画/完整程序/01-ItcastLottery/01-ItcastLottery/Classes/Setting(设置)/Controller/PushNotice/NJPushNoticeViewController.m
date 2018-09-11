//
//  ILPushNoticeViewController.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "NJPushNoticeViewController.h"
#import "NJAwardPushViewController.h"
#import "NJAwardAnimViewController.h"
#import "NJScoreShowNoticeViewController.h"
#import "NJBuyTimedNoticeViewController.h"

@interface NJPushNoticeViewController ()

@end

@implementation NJPushNoticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"推送和提醒";
    
    // 1.1 开奖号码推送
    NJSettingArrowItem *push = [NJSettingArrowItem itemWithTitle:@"开奖号码推送"];
    push.showVCClass = [NJAwardPushViewController class];
    
    // 1.2 中奖动画
    NJSettingArrowItem *anim = [NJSettingArrowItem itemWithTitle:@"中奖动画"];
    anim.showVCClass = [NJAwardAnimViewController class];
    
    // 1.3 比分直播提醒
    NJSettingArrowItem *score = [NJSettingArrowItem itemWithTitle:@"比分直播提醒"];
    score.showVCClass = [NJScoreShowNoticeViewController class];
    
    // 1.4 购彩定时提醒
    NJSettingArrowItem *time = [NJSettingArrowItem itemWithTitle:@"购彩定时提醒"];
    time.showVCClass = [NJBuyTimedNoticeViewController class];
    
    NJSettingGroup *group = [NJSettingGroup groupWithItems:@[push, anim, score, time]];
    [_allGroups addObject:group];
}

@end
