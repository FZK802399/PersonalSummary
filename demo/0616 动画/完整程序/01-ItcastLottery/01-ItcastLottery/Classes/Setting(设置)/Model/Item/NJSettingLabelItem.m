//
//  NJSettingLabelItem.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJSettingLabelItem.h"

@implementation NJSettingLabelItem
- (void)setKey:(NSString *)key
{
    [super setKey:key];
    
    _text = [NJSettingTool objectForKey:key];
}

- (void)setText:(NSString *)text
{
    _text = text;
    
    [NJSettingTool setObject:text forKey:self.key];
}
@end
