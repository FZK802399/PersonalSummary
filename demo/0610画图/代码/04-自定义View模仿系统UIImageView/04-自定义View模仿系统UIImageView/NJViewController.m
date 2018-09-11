//
//  NJViewController.m
//  04-自定义View模仿系统UIImageView
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"
#import "NJImageView.h"

@interface NJViewController ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) NJImageView *njIv;
@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
    UIImageView *iv = [[UIImageView alloc] init];
    iv.image = [UIImage imageNamed:@"me"];
    iv.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:iv];
    self.imageView = iv;
     */
    
    
    NJImageView *njIv = [[NJImageView alloc] init];
    njIv.image = [UIImage imageNamed:@"me"];
    njIv.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:njIv];
    self.njIv = njIv;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"点点大家的疯狂的教科书" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)btnClick
{
    NSLog(@"btnClick");
    
    // 创建一张新的图片替换原有图片
    UIImage *image = [UIImage imageNamed:@"psb.jpeg"];
    
    // self.imageView.image = image;
    self.njIv.image = image;
}
@end
