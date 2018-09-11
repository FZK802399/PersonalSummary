//
//  NJShareViewController.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJShareViewController.h"

@interface NJShareViewController ()

@end

@implementation NJShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"分享设置";
    
    // 1.1.新浪微博
    NJSettingArrowItem *weibo = [NJSettingArrowItem itemWithIcon:@"WeiboSina" title:@"新浪微博"];
    
    // 1.2.短信分享
    NJSettingArrowItem *sms = [NJSettingArrowItem itemWithIcon:@"SmsShare" title:@"短信分享"];
    
    // 1.3.邮件分享
    NJSettingArrowItem *mail = [NJSettingArrowItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    
    NJSettingGroup *group = [NJSettingGroup groupWithItems:@[weibo, sms, mail]];
    [_allGroups addObject:group];
}

@end
