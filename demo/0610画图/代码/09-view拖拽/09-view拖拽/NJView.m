//
//  NJView.m
//  09-view拖拽
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJView.h"

@implementation NJView

// 触摸事件完整的调用过程touchesBegan --> touchesMoved --> touchesEnded
// 当手指触摸view的时候调用
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [event allTouches] == touches
    
//    NSArray:用来保存同一种类型的有序的值
//    NSSet:  用来保存无序的值
//    NSArray *arr = @[@"1", @"2", @"3"];
//    arr[2];
//    NSSet set = @[@"2", @"3",@"1"];
    
//    UITouch *touch = [touches anyObject];
    // 获取手指触摸的位置
    // 如果locationInView传递self, 将来获取出来的位置,是以自己的左上角为原点(00)
    // 如果传递的是父视图,将来获取出来的位置,是以父视图的左上角为原点(00)
//    CGPoint point = [touch locationInView:self.superview];
//    NSLog(@"touchesBegan %@", NSStringFromCGPoint(point));
    
    // 获取手指点击的次数
//    NSLog(@"tapCount = %d", touch.tapCount);
    
//    NSLog(@"touchesBegan %p", touch);
    
    
    NSLog(@"%d", touches.count);
}
// 当手指在view上移动的时候调用
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    UITouch *touch = [touches anyObject];
//     NSLog(@"touchesMoved %p", touch);
    
    UITouch *touch = [touches anyObject];
    // 0. 获取上一次的位置
    CGPoint prePoint = [touch previousLocationInView:self];
//    NSLog(@"prePoint = %@", NSStringFromCGPoint(prePoint));
    
    // 1.获取当前的位置
    CGPoint currentPoint = [touch locationInView:self];
//    NSLog(@"currentPoint = %@", NSStringFromCGPoint(currentPoint));
    
    CGFloat moveX = currentPoint.x - prePoint.x;
    CGFloat moveY = currentPoint.y - prePoint.y;
    
//    NSLog(@"moveX = %.1f", moveX);

    // 2.改变当前视图的位置,为手指指定的位置
    CGPoint temp =  self.center;
//    NSLog(@"%f,%f",self.bounds.origin.x,self.bounds.origin.y);
    temp.x += moveX;
    temp.y += moveY;
    self.center = temp;

}
// 当手指离开view的时候调用
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    UITouch *touch = [touches anyObject];
//    NSLog(@"touchesEnded %p", touch);
}
// 当触摸事件被打断的时候调用
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
@end
