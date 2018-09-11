//
//  NJView.m
//  07-图片剪切
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJView.h"

@implementation NJView

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
     CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 100, 100));
    CGContextClip(ctx);
//    CGContextStrokePath(ctx);
    
    
    UIImage *image = [UIImage imageNamed:@"me"];
    [image drawInRect:CGRectMake(100, 100, 100, 100)];
    
    
}


@end
