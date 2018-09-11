//
//  NJViewController.m
//  02-自定义Layer
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"
#import "NJLayer.h"

@interface NJViewController ()

@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 1.创建自定义Layer
    CALayer *myLayer = [CALayer layer];
    myLayer.bounds = CGRectMake(0, 0, 100, 100);
    myLayer.anchorPoint = CGPointZero;
    myLayer.backgroundColor = [UIColor greenColor].CGColor;
    
    myLayer.delegate = self;
    
    // 1.1手动调用CALayer中的SETNEEDDISPLAY方法绘制图片
    [myLayer setNeedsDisplay];
    
    // 2.将自定义Layer添加到控制器的view的layer上
    [self.view.layer addSublayer:myLayer];
}

// 通过代理自定义layer
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
    // 1.绘制图形
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 50, 100));

    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    // 1.渲染图形
    CGContextFillPath(ctx);
}


- (void)test
{
    // 1.创建自定义Layer
    NJLayer *myLayer = [NJLayer layer];
    
    myLayer.bounds = CGRectMake(0, 0, 100, 100);
    myLayer.anchorPoint = CGPointZero;
    myLayer.backgroundColor = [UIColor greenColor].CGColor;
    //    myLayer.position = CGPointMake(200, 200);
    
    // 1.1手动调用CALayer中的SETNEEDDISPLAY方法绘制图片
    [myLayer setNeedsDisplay];
    
    // 2.将自定义Layer添加到控制器的view的layer上
    [self.view.layer addSublayer:myLayer];
}


@end
