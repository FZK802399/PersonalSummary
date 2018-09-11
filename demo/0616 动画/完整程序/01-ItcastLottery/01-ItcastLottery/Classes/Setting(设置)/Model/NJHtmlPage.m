//
//  NJHtmlPage.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJHtmlPage.h"

@implementation NJHtmlPage
+ (instancetype)htmlPageWithDict:(NSDictionary *)dict
{
    NJHtmlPage *hp = [[self alloc] init];
    hp.title = dict[@"title"];
    hp.html = dict[@"html"];
    hp.ID = dict[@"id"];
    return hp;
}
@end
