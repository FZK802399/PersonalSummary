//
//  NJView.m
//  02-刷帧动画
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJView.h"

@interface NJView()
@property (nonatomic, assign) int imageY;

@end

@implementation NJView

-(void)awakeFromNib
{

    NSLog(@"awakeFromNib");
    // 创建CADisplayLink, 默认每秒60次
    CADisplayLink *display = [CADisplayLink displayLinkWithTarget:self selector:@selector(updataImage)];
    // 将CADisplayLink加入到消息循环中
    [display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

/*
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        NSLog(@"initWithCoder");
        
        // NSTimer一般用于定时的更新一些非界面上的数据
        [NSTimer scheduledTimerWithTimeInterval:
         0.1 target:self selector:@selector(updataImage) userInfo:nil repeats:YES];
 
        // 创建CADisplayLink, 默认每秒60次
        CADisplayLink *display = [CADisplayLink displayLinkWithTarget:self selector:@selector(updataImage)];
        // 将CADisplayLink加入到消息循环中
        [display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        
    }
    return self;
}
*/
- (void)updataImage
{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, rect);
    
    self.imageY += 5;
    
    if (self.imageY > rect.size.height) {
        self.imageY = 0;
    }
    // Drawing code
    UIImage *image = [UIImage imageNamed:@"snow"];
    [image   drawAtPoint:CGPointMake(10, self.imageY)];
    
//    [self setNeedsDisplay];
    
}


@end




