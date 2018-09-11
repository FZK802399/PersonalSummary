//
//  NJSettingViewController.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJSettingViewController.h"
#import "NJPushNoticeViewController.h"
#import "NJShareViewController.h"
#import "NJAboutViewController.h"
#import "NJHelpViewController.h"
#import "NJProductsViewController.h"

@interface NJSettingViewController ()
@end

@implementation NJSettingViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.第0组：3个
    [self add0SectionItems];
    
    // 2.第1组：6个
    [self add1SectionItems];
}

#pragma mark 添加第0组的模型数据
- (void)add0SectionItems
{
    // 1.1.推送和提醒
    NJSettingArrowItem *push = [NJSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒"];
    push.showVCClass = [NJPushNoticeViewController class];
    
    // 1.2.摇一摇机选
    NJSettingSwitchItem *shake = [NJSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    shake.key = NJSettingShakeChoose;
    
    // 1.3.声音效果
    NJSettingSwitchItem *sound = [NJSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    sound.key = NJSettingSoundEffect;
    
    NJSettingGroup *group = [NJSettingGroup groupWithItems:@[push, shake, sound]];
    [_allGroups addObject:group];
}

#pragma mark 添加第1组的模型数据
- (void)add1SectionItems
{
    // 2.1.检查新版本
    NJSettingArrowItem *update = [NJSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    update.operation = ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"目前已是最新版本了" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    };
    
    // 2.2.帮助
    NJSettingArrowItem *help = [NJSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助"];
    help.showVCClass = [NJHelpViewController class];
    
    // 2.3.分享
    NJSettingArrowItem *share = [NJSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享"];
    share.showVCClass = [NJShareViewController class];
    
    // 2.4.查看消息
    NJSettingArrowItem *msg = [NJSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息"];
    
    // 2.5.产品推荐
    NJSettingArrowItem *product = [NJSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐"];
    product.showVCClass = [NJProductsViewController class];
    
    // 2.6.关于
    NJSettingArrowItem *about = [NJSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于"];
    about.showVCClass = [NJAboutViewController class];
    
    NJSettingGroup *group = [NJSettingGroup groupWithItems:@[update, help, share, msg, product, about]];
    [_allGroups addObject:group];
}
@end