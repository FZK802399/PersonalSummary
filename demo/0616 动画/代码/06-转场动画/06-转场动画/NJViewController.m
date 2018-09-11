//
//  NJViewController.m
//  06-转场动画
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"

@interface NJViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
- (IBAction)nextBtnClick:(id)sender;
- (IBAction)preBtnClick:(id)sender;

@property (nonatomic, assign) int index;
@end

@implementation NJViewController

// 下一张
- (IBAction)nextBtnClick:(id)sender {
    self.index++;
    if (self.index >7) {
        self.index = 1;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"%d.jpg", self.index];
    UIImage *newImage = [UIImage imageNamed:imageName];
    self.iconView.image = newImage;
    
    // 1.创建核心动画
    CATransition *ca = [CATransition animation];
    // 1.1动画过渡类型
    ca.type = @"cube";
    // 1.2动画过渡方向
    ca.subtype =  kCATransitionFromRight;
    // 1.3动画起点(在整体动画的百分比)
//    ca.startProgress = 0.5;
    ca.endProgress = 0.5;
    
    
    // 动画时间
    ca.duration = 1;
    
    // 2.添加核心动画
    [self.iconView.layer addAnimation:ca forKey:nil];
}

// 上一张
- (IBAction)preBtnClick:(id)sender {
    self.index--;
    if (self.index < 1) {
        self.index = 7;
    }
    NSString *imageName = [NSString stringWithFormat:@"%d.jpg", self.index];
    UIImage *newImage = [UIImage imageNamed:imageName];
    self.iconView.image = newImage;
    
    // 1.创建核心动画
    CATransition *ca = [CATransition animation];
    // 1.1告诉系统执行什么动画
    ca.type = @"cube";
    ca.subtype =  kCATransitionFromLeft;
    
    ca.duration = 1;
    
    // 2.添加核心动画
    [self.iconView.layer addAnimation:ca forKey:nil];

}
@end
