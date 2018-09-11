//
//  NJSettingItem.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJSettingItem.h"

@implementation NJSettingItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    NJSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}
@end
