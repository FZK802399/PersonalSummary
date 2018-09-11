//
//  NJViewController.m
//  01-隐式动画
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"

@interface NJViewController ()

@property (nonatomic, strong) CALayer *layer;
@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.anchorPoint = CGPointZero;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 关闭隐式动画
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
    
    // 隐式动画
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
//    self.layer.bounds = CGRectMake(0, 0, 200, 200);
    self.layer.position = CGPointMake(200, 200);
    //    self.layer.position // 如何查看CALayer的某个属性是否支持隐式动画, 查看头文件是否有 Animatable
    
//    [CATransaction commit];
    
}
@end
