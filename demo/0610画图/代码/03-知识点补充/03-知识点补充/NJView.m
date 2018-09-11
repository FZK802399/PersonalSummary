//
//  NJView.m
//  03-知识点补充
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJView.h"

@implementation NJView

- (void)drawRect:(CGRect)rect
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.绘制图形
    /*
    // 设置起点
    CGContextMoveToPoint(ctx, 10, 10);
    // 设置终点
    CGContextAddLineToPoint(ctx, 100, 100);
    
    // 3.画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 50, 50));
    */
    
   
    // 2.创建路径(一个path就代表一条路径)
    // 但凡通过quarzt2d中的带有create/ copy / retain 方法创建出来的值都必须手动的释放
    CGMutablePathRef path = CGPathCreateMutable();
    // 设置起点
    CGPathMoveToPoint(path, NULL, 10, 10);
    // 设置终点
    CGPathAddLineToPoint(path, NULL, 100, 100);
    // 将路径添加到上下文中
    CGContextAddPath(ctx, path);
    
    // 3.再创建一条路径用于保存圆
     CGMutablePathRef path2 = CGPathCreateMutable();
    // 在path中添加画的路径
    CGPathAddEllipseInRect(path2, NULL, CGRectMake(50, 50, 50, 50));
    CGContextAddPath(ctx, path2);
    
    // 3.渲染'
    CGContextStrokePath(ctx);
    
    
    // 释放前面创建的两条路径
    CGPathRelease(path);
    CGPathRelease(path2);
    
    // 下面这种方式也可以释放路径
    
//    CFRelease(path);
//    CFRelease(path2);
}

- (void)test
{
    // 画四边形
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //    1.第一种方式, 通过连接固定的点绘制四边形
    //    CGContextMoveToPoint(ctx, 0, 0);
    //    CGContextAddLineToPoint(ctx, <#CGFloat x#>, <#CGFloat y#>)
    //    CGContextAddLineToPoint(ctx, <#CGFloat x#>, <#CGFloat y#>)
    //    CGContextAddLineToPoint(ctx, <#CGFloat x#>, <#CGFloat y#>)
    //    CGContextAddLineToPoint(ctx, <#CGFloat x#>, <#CGFloat y#>)
    
    
    //    2.指定起点和宽高绘制四边形
    //    CGContextAddRect(ctx, CGRectMake(10, 10, 100, 100));
    //    CGContextStrokePath(ctx);
    
    // 3.两步合为一部
    //    CGContextStrokeRect(ctx, CGRectMake(10, 10, 100, 100));
    //    CGContextFillRect(ctx, CGRectMake(10, 10, 100, 100));
    
    // 4.通过OC的方法绘制实心的四边形, 注意没有空心的方法
    //    UIRectFill(CGRectMake(10, 10, 100, 100));
    
    // 5.通过绘制线条设置宽度
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextSetLineWidth(ctx, 50);
    CGContextStrokePath(ctx);
}


@end
