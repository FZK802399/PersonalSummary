//
//  NJView.m
//  04-自定义View模仿系统UIImageView
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJImageView.h"

@implementation NJImageView


- (void)drawRect:(CGRect)rect
{
    // Drawing code

    [self.image drawInRect:rect];
}


-(void)setImage:(UIImage *)image
{
    _image = image;
    
    [self setNeedsDisplay];
}

@end
