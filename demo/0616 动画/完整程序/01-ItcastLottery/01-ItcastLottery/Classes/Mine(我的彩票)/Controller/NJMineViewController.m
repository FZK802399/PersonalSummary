//
//  NJMineViewController.m
//  ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJMineViewController.h"
#import "UIImage+Fit.h"

@interface NJMineViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation NJMineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.背景色
    self.view.backgroundColor = NJGlobalBg;
    
    // 2.登录按钮背景
    [_loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButton"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButtonPressed"] forState:UIControlStateHighlighted];
}

@end
