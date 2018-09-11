//
//  NJLuckyNumViewController.m
//  ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJLuckyNumViewController.h"
#import "NJCircleView.h"
#import "NJThreeButton.h"

@interface NJLuckyNumViewController ()
{
    NJThreeButton *_three;
    NJCircleView *_circle;
}
@end

@implementation NJLuckyNumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.设置背景
    [self addBg];
    
    // 2.添加3个按钮
    [self addThreeButton];
    
    // 3.添加转盘
    [self addCircle];
    
}

#pragma mark 添加转盘
- (void)addCircle
{
    NJCircleView *circle = [NJCircleView circleView];
    CGFloat centerX = self.view.frame.size.width * 0.5;
    CGFloat centerY = CGRectGetMaxY(_three.frame) + circle.frame.size.height * 0.5;
    if (!is4Inch) {
        centerY -= 20;
    }
    circle.center = CGPointMake(centerX, centerY);
    [self.view addSubview:circle];
    _circle = circle;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [_circle pauseRotate];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_circle startRotate];
}

#pragma mark 添加三个按钮
- (void)addThreeButton
{
    NJThreeButton *tb = [NJThreeButton threeButton];
    CGFloat tbCenterX = self.view.frame.size.width * 0.5;
    CGFloat tbCenterY = tb.frame.size.height * 0.5 + 10;
    tb.center = CGPointMake(tbCenterX, tbCenterY);
    [self.view addSubview:tb];
    _three = tb;
}

#pragma mark 设置背景
- (void)addBg
{
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.frame = self.view.bounds;
    bgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    bgView.image = [UIImage imageNamed:is4Inch?@"LuckyBackground-568h.jpg":@"LuckyBackground.jpg"];
    [self.view addSubview:bgView];
}
@end