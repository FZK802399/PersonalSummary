//
//  NJViewController.m
//  03-基本动画
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface NJViewController ()

@property (nonatomic, strong) CALayer *myLayer;

@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 1.创建layer
    CALayer *myLayer = [CALayer layer];
    myLayer.bounds = CGRectMake(0, 0, 100, 100);
    
    myLayer.anchorPoint = CGPointZero;
    myLayer.position = CGPointMake(100, 100);
    myLayer.backgroundColor = [UIColor greenColor].CGColor;
    // 2.将自定义Layer添加到控制器的view的layer上
    [self.view.layer addSublayer:myLayer];
    
    self.myLayer = myLayer;

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1. 创建核心动画
    CABasicAnimation *anima = [CABasicAnimation animation] ;
    // 1.1设置动画类型
//    anima.keyPath = @"transform.translation.x";
    anima.keyPath = @"transform.scale.y";
    
    // 1.2 设置动画执行完毕之后不删除动画
    anima.removedOnCompletion = NO;
    // 1.3 设置保存动画的最新状态
    anima.fillMode = kCAFillModeForwards;
    // 1.4设置动画时间
    anima.duration = 1;
    
    // 1.5如何动画
//    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 100, 1)];
//    anima.toValue = @(100);
    anima.toValue = @(1.5);
 
    
    // 2.添加核心动画到Layer
    [self.myLayer addAnimation:anima forKey:nil];

}

- (void)test2
{
    // 1. 创建核心动画
    CABasicAnimation *anima = [CABasicAnimation animation] ;
    // 1.1设置动画类型
    anima.keyPath = @"transform";
    
    
    // 1.2 设置动画执行完毕之后不删除动画
    anima.removedOnCompletion = NO;
    // 1.3 设置保存动画的最新状态
    anima.fillMode = kCAFillModeForwards;
    // 1.4设置动画时间
    anima.duration = 1;
    
    // 1.5修改动画
    anima.toValue =  [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, 1)];
    
    // 2.添加核心动画到Layer
    [self.myLayer addAnimation:anima forKey:nil];
}


- (void)test1
{
    // 1. 创建核心动画
    CABasicAnimation *anima = [CABasicAnimation animation] ;
    // 1.1设置动画类型
    anima.keyPath = @"bounds";
    
    // 1.2 设置动画执行完毕之后不删除动画
    anima.removedOnCompletion = NO;
    // 1.3 设置保存动画的最新状态
    anima.fillMode = kCAFillModeForwards;
    // 1.4设置动画时间
    anima.duration = 1;
    
    // 1.5修改动画
    anima.toValue =[NSValue valueWithCGRect: CGRectMake(0, 0, 200, 200)];
    
    // 2.添加核心动画到Layer
    [self.myLayer addAnimation:anima forKey:nil];
}

- (void)test
{
    // 1. 创建核心动画
    CABasicAnimation *anima = [CABasicAnimation animation] ;
    // 1.1告诉系统要执行什么样的动画
    anima.keyPath = @"position";
    // 设置通过动画将layer从哪
    //    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    // 到哪(到指定的位置)
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    //    在当前位置的基础上增加多少
    //    anima.byValue = [NSValue valueWithCGPoint:CGPointMake(0, 300)];
    
    // 设置动画时间
    anima.duration = 5;
    
    // 1.2 设置动画执行完毕之后不删除动画
    anima.removedOnCompletion = NO;
    // 1.3 设置保存动画的最新状态
    anima.fillMode = kCAFillModeForwards;
    
    // 2.添加核心动画到Layer
    [self.myLayer addAnimation:anima forKey:nil];
}


@end
