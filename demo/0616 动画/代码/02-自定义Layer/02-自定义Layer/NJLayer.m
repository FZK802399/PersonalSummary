//
//  NJLayer.m
//  02-自定义Layer
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJLayer.h"

@implementation NJLayer

// 重写该方法, 在该方法中给layer上绘制图形
// 注意CALayer中的drawInContext方法, 不会自动调用
// 只能自己通过setNeedDisplay方法调用
- (void)drawInContext:(CGContextRef)ctx
{

    // 1.绘制图形
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    
//    [[UIColor redColor] set]; // 注意不能用UIKit框架中的类
    
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    // 1.渲染图形
    CGContextFillPath(ctx);
}

@end
