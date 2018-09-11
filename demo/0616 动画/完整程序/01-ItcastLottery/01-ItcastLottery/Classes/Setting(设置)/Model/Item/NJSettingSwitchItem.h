//
//  NJSettingSwitchItem.h
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJSettingValueItem.h"

@interface NJSettingSwitchItem : NJSettingValueItem
@property (nonatomic, assign, getter = isOff) BOOL off;
@end
