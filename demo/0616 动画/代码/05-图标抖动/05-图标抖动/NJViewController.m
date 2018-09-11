//
//  NJViewController.m
//  05-图标抖动
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"

#define angle2Radian(angle) ((angle) / 180.0 * M_PI)

@interface NJViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

@implementation NJViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.创建核心动画
    CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"transform.rotation";
    // 度数 / 180 * M_PI
    keyAnima.values = @[@(-angle2Radian(4)), @(angle2Radian(4)), @(-angle2Radian(4))];

    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.duration = 0.1;
    
    // 设置动画重复的次数
    keyAnima.repeatCount = MAXFLOAT;
    
    // 2.添加核心动画
    [self.iconView.layer addAnimation:keyAnima forKey:nil];
}

@end
