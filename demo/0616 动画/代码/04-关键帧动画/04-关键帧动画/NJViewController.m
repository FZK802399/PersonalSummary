//
//  NJViewController.m
//  04-关键帧动画
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"

@interface NJViewController ()

@property (weak, nonatomic) IBOutlet UIView *customView;
- (IBAction)btnClick:(id)sender;
@end

@implementation NJViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self test];
//    [self test1];
}

- (void)test1
{
    // 1.创建核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    // 1.1告诉系统执行什么动画
    keyAnima.keyPath = @"position";
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 100, 200, 200));
    
    keyAnima.path = path;
    CGPathRelease(path);
    
    // 1.2保存执行完之后的状态
    // 1.2.1执行完之后不删除动画
    keyAnima.removedOnCompletion = NO;
    // 1.2.2执行完之后保存最新的状态
    keyAnima.fillMode = kCAFillModeForwards;
    
    // 1.3设置动画时间
    keyAnima.duration = 2;
    // 2.观察动画什么时候开始执行, 以及什么时候执行完毕
    keyAnima.delegate = self;
    // 3.添加核心动画
    [self.customView.layer addAnimation:keyAnima forKey:@"abc"];
}

- (IBAction)btnClick:(id)sender {
    
    // 停止动画
    [self.customView.layer removeAnimationForKey:@"abc"];
}


- (void)test
{
    // 1.创建核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    // 1.1告诉系统执行什么动画
    keyAnima.keyPath = @"position";
    //    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(0, 100)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(0, 200)];
    NSValue *v5 = [NSValue valueWithCGPoint:CGPointMake(0, 100)];
    
    keyAnima.values = @[v2, v3, v4, v5];
    
    //    keyAnima.keyTimes = @[@(0.5) ,@(0.5), @(0.5)];
    
    keyAnima.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // 1.2保存执行完之后的状态
    // 1.2.1执行完之后不删除动画
    keyAnima.removedOnCompletion = NO;
    // 1.2.2执行完之后保存最新的状态
    keyAnima.fillMode = kCAFillModeForwards;
    
    // 1.3设置动画时间
    keyAnima.duration = 2;
    
    // 2.观察动画什么时候开始执行, 以及什么时候执行完毕
    keyAnima.delegate = self;
    
    
    // 2.添加核心动画
    [self.customView.layer addAnimation:keyAnima forKey:nil];
}

- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animationDidStart");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animationDidStop");
}


@end
