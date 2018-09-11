//
//  NJViewController.m
//  07-图片剪切
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"
#import "UIImage+NJ.h"

@interface NJViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iv;

@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImage *newImage = [UIImage imageWithIcon:@"me" border:50 color:[UIColor greenColor]];
    self.iv.image = newImage;
    
}

- (void)test1
{
    // 0. 加载原有图片
    UIImage *image = [UIImage imageNamed:@"me"];
    
    // 1.创建图片上下文
    CGFloat margin = 10;
    CGSize size = CGSizeMake(image.size.width + margin, image.size.height + margin);
    
    // YES 不透明 NO 透明
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 2.绘制大圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, size.width, size.height));
    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
    
    // 3.绘制小圆
    CGFloat smallX = margin * 0.5;
    CGFloat smallY = margin * 0.5;
    CGFloat smallW = image.size.width;
    CGFloat smallH = image.size.height;
    CGContextAddEllipseInRect(ctx, CGRectMake(smallX, smallY, smallW, smallH));
    //    [[UIColor greenColor] set];
    //    CGContextFillPath(ctx);
    // 4.指点可用范围, 可用范围的适用范围是在指定之后,也就说在在指定剪切的范围之前绘制的东西不受影响
    CGContextClip(ctx);
    
    // 5.绘图图片
    [image drawInRect:CGRectMake(smallX, smallY, smallW, smallH)];
    
    // 6.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    self.iv.image = newImage;
    // 7.保存图片
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"aaa.png"];
    NSLog(@"%@", path);
    
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:path atomically:YES];
}

- (void)test
{
    // 0 .加载图片
    UIImage *image = [UIImage imageNamed:@"me"];
    
    // 1.创建图片上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 2.指点可用范围
    // 获取刚才创建的图片上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, image.size.width, image.size.height));
    // 指点可用范围
    CGContextClip(ctx);
    
    // 3.绘图图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    // 4.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    self.iv.image = newImage;
    // 5.存储图片
    // 2.将图片写到文件中
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"aaa.png"];
    NSLog(@"%@", path);
    
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:path atomically:YES];
}


@end

