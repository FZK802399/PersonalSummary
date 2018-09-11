//
//  ILAwardAnimViewController.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-24.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "NJAwardAnimViewController.h"

@interface NJAwardAnimViewController ()

@end

@implementation NJAwardAnimViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"中奖动画";
    
    NJSettingSwitchItem *anim = [NJSettingSwitchItem itemWithTitle:self.title];
    anim.key = NJSettingAwardAnim;
    
    NJSettingGroup *group = [NJSettingGroup groupWithItems:@[anim]];
    group.header = @"当您有新中奖订单，启动程序时通过动画提醒您。为避免过于频繁，高频彩不会提醒。";
    [_allGroups addObject:group];
}

@end
