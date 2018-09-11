//
//  NJProduct.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJProduct.h"

@implementation NJProduct
+ (instancetype)productWithDict:(NSDictionary *)dict
{
    NJProduct *p = [[self alloc] init];
    p.title = dict[@"title"];
    p.icon = dict[@"icon"];
    return p;
}
@end
