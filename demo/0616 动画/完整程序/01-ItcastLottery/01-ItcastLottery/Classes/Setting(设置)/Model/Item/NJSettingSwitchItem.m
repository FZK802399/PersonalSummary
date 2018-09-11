//
//  NJSettingSwitchItem.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJSettingSwitchItem.h"

@implementation NJSettingSwitchItem
- (void)setKey:(NSString *)key
{
    [super setKey:key];
    
    _off = [NJSettingTool boolForKey:key];
}

- (void)setOff:(BOOL)off
{
    _off = off;
    
    [NJSettingTool setBool:off forKey:self.key];
}
@end