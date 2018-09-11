//
//  NJTabBarController.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJTabBarController.h"
#import "NJTabBar.h"

@interface NJTabBarController () <NJTabBarDelegate>

@end

@implementation NJTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建tabbar
    NJTabBar *myTabBar = [[NJTabBar alloc] init];
    myTabBar.frame = self.tabBar.bounds;
    myTabBar.delegate = self;
    [self.tabBar addSubview:myTabBar];
    
    // 2.添加5个按钮
    for (int i = 1; i<=5; i++) {
        NSString *normal = [NSString stringWithFormat:@"TabBar%d", i];
        NSString *selected = [normal stringByAppendingString:@"Sel"];
        [myTabBar addTabBarButton:normal selIcon:selected];
    }
}

#pragma mark - tabbar代理方法
- (void)tabBar:(NJTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to
{
    self.selectedIndex = to;
}
@end