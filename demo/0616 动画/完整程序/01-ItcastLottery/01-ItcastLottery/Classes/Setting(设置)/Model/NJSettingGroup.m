//
//  NJSettingGroup.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJSettingGroup.h"

@implementation NJSettingGroup
+ (instancetype)groupWithItems:(NSArray *)items
{
    NJSettingGroup *group = [[self alloc] init];
    group.items = items;
    return group;
}
@end
