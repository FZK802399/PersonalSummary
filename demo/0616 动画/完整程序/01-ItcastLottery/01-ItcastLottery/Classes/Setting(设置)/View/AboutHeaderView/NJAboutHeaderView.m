//
//  NJAboutHeaderView.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJAboutHeaderView.h"

@implementation NJAboutHeaderView

+ (instancetype)headerView
{
    return [[NSBundle mainBundle] loadNibNamed:@"NJAboutHeaderView" owner:nil options:nil][0];
}
@end
