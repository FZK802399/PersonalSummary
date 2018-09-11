//
//  NJTabBarController.m
//  09-彩票(lottery)
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJTabBarController.h"
#import "NJTabBar.h"
#import "NJTabBarButton.h"

@interface NJTabBarController ()<NJTabBarDelegate>


@end

@implementation NJTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 1.创建自定义的TabBar
    NJTabBar *myTabBar = [[NJTabBar alloc] init];
    myTabBar.frame = self.tabBar.frame;
    myTabBar.delegate = self;
//    NJTabBar *myTabBar = [[NJTabBar alloc] initWithFrame:self.tabBar.frame];
    
    [self.view addSubview:myTabBar];
    
    // 2.删除系统自带的tabBar
    [self.tabBar removeFromSuperview];
  
}

#pragma mark - NJTabBarDelegate
- (void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to
{
    // 切换子控制器
    self.selectedIndex = to;
}

@end
