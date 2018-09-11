//
//  NJView.m
//  02-自定义Layer
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJView.h"

@implementation NJView

- (void)drawRect:(CGRect)rect
{
    // 1.获取上下文 layer的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘制图形
    // 1.绘制图形
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);

    // 3.渲染
    CGContextFillPath(ctx);
    
    // [self.layer drawInContext:ctx];
    
}


@end
