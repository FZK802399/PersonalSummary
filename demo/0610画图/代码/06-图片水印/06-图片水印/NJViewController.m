//
//  NJViewController.m
//  06-图片水印
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"
#import "UIImage+NJ.h"

@interface NJViewController ()

@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 1.调用分类方法生成水印图片
    UIImage *newImage =  [UIImage imageWithBackgroundImageName:@"psb" log:@"logo1"];
    
    // 2.将图片写到文件中
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"aaa.png"];
    NSLog(@"%@", path);
    
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:path atomically:YES];

}

- (void)test
{
    // 0. 加载背景图片
    UIImage *image = [UIImage imageNamed:@"psb"];
    
	// 1.创建bitmap上下文
    // 执行完这一行在内存中就相遇创建了一个UIImage
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 2.绘图图片
    // 2.1绘制背景图片
    [image drawAtPoint:CGPointMake(0, 0)];
    
    // 2.2绘制水印
    /*
     UIImage *logImage = [UIImage imageNamed:@"logo1"];
     
     CGFloat margin = 10;
     CGFloat logY = margin;
     CGFloat logX = image.size.width - margin - logImage.size.width;
     [logImage drawAtPoint:CGPointMake(logX, logY)];
     */
    
    // 2.3绘制文字水印
    NSString *str = @"黑马程序员";
    [str drawAtPoint:CGPointMake(150, 50) withAttributes:nil];
    
    // 3.获得bitmap上下文中绘制号的图片
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.将图片写到文件中
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"aaa.png"];
    NSLog(@"%@", path);
    
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:path atomically:YES];
}


@end
