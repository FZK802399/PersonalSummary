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
    
//    NSLog(@"viewControllers = %d", self.viewControllers.count);
    // 1.1根据系统子控制器的个数来创建自定义TabBar上按钮的个数
    for (int i = 0; i < self.viewControllers.count; i++) {
        // 通知自定义TabBar创建按钮
         NSString *norImageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *disableImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        // 只要调用自定义TabBar的该方法就会创建一个按钮
        [myTabBar addTabBarButtonWithNormalImageName:norImageName andDisableImageName:disableImageName];
    }
    
    /*
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.frame = CGRectMake(0, 0, 320, 480);
    vc.view.backgroundColor = [UIColor redColor];
    vc.tabBarItem.title = @"abc";
    vc.tabBarItem.image = [UIImage imageNamed:@"abc.png"];
    
    [self addChildViewController:vc];
    */
    
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
