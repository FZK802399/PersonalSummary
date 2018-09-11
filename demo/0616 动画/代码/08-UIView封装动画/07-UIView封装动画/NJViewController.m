//
//  NJViewController.m
//  07-UIView封装动画
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"

@interface NJViewController ()
@property (weak, nonatomic) IBOutlet UIView *cutomView;

@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
//    [UIView transitionWithView:self.view duration:1.0 options:0 animations:^{
//        NSLog(@"animations");
//        // 要执行的动画
//        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
//
//    } completion:^(BOOL finished) {
//        NSLog(@"completion");
//        // 执行完毕之后执行的动画
//    }];
    [self test1];
}

- (void)test2
{
    [UIView animateWithDuration:2.0 animations:^{
        NSLog(@"动画执行之前: %@",NSStringFromCGPoint(self.cutomView.center));
        // 需要执行动画的代码
        self.cutomView.center = CGPointMake(300, 300);
        
    } completion:^(BOOL finished) {
        // 动画执行完毕之后执行的代码
        NSLog(@"动画执行之后: %@",NSStringFromCGPoint(self.cutomView.center));
        
    }];
}

- (void)test1
{
    // 1.创建核心动画
    // 注意点:如果通过核心动画改变layer的位置状态, 表面上看上去已经改变了, 但是实质上是没有改变的
    CABasicAnimation *anima = [CABasicAnimation animation];
    anima.keyPath = @"position";
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    
    anima.delegate = self;
    
    // 2.添加核心动画
    [self.cutomView.layer addAnimation:anima forKey:nil];
}

- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"核心动画执行之前 %@", NSStringFromCGPoint(self.cutomView.layer.position));

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"核心动画执行完毕 %@", NSStringFromCGPoint(self.cutomView.layer.position));
}

- (void)test
{
    // 1.UIVIEW封装的动画, 动画执行完毕之后不会反弹
    NSLog(@"动画执行之前: %@",NSStringFromCGPoint(self.cutomView.center));
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(didStopAnimatino)];
    self.cutomView.center = CGPointMake(300, 300);
    [UIView commitAnimations];
    
}

- (void)didStopAnimatino
{
    NSLog(@"动画执行完毕 %@", NSStringFromCGPoint(self.cutomView.center));
}




@end
