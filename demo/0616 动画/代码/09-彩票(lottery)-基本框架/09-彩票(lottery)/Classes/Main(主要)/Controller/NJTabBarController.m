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

@interface NJTabBarController ()

// 定义变量记录当前选中的按钮
@property (nonatomic, weak) UIButton *selectBtn;

@end

@implementation NJTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 1.创建自定义的TabBar
    NJTabBar *myTabBar = [[NJTabBar alloc] init];
//    myTabBar.backgroundColor = [UIColor greenColor];
    myTabBar.frame = self.tabBar.frame;
    
    [self.view addSubview:myTabBar];
    
    // 2.删除系统自带的tabBar
    [self.tabBar removeFromSuperview];
    
    // 3.创建5个按钮,添加到自定义TabBar上
    for (int i = 0; i < 5; i++) {
        // 3.1创建按钮
        NJTabBarButton *btn = [[NJTabBarButton alloc] init];
        // 3.2设置按钮上显示的图片
        // 3.2.1设置默认状态图片
        NSString *norImageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        [btn setBackgroundImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
        /*
        // 3.2.2设置选中状态图片
        // 更正,由于按钮被选中后不应再被点击, 所以应该用不可用状态
        NSString *selImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        [btn setBackgroundImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
         */
        
          NSString *disableImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
         [btn setBackgroundImage:[UIImage imageNamed:disableImageName] forState:UIControlStateDisabled];
        
        // 3.3设置frame
        CGFloat btnY = 0;
        CGFloat btnW = myTabBar.frame.size.width / 5;
        CGFloat btnH = myTabBar.frame.size.height;
        CGFloat btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 3.4添加按钮到自定义TabBar
        [myTabBar addSubview:btn];
        
        // 3.5监听按钮点击事件
//        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
         [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchDown];
        
        // 3.6设置默认选中按钮
        if (0 == i) {
            [self btnOnClick:btn];
        }
        
        // 3.7设置按钮高亮状态不调整图片
        btn.adjustsImageWhenHighlighted = NO;
        
        // 3.8设置按钮的Tag作为将来切换子控制器的索引
        btn.tag = i;

    }
    
}

/*
 默认
 高亮
 选中
 不可用
 */

- (void)btnOnClick:(UIButton *)btn
{
    NSLog(@"btnOnClick");
    // 0.取消上一次选中的按钮
//    self.selectBtn.selected = NO;
    self.selectBtn.enabled = YES;
    
    // 1.设置当前被点击按钮为选中状态
//    btn.selected = YES;
    btn.enabled = NO;
    
    // 2.记录当前选中的按钮
    self.selectBtn = btn;
    
    // 3.切换子控制器
    self.selectedIndex = btn.tag;
}

@end
