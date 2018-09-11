//
//  NJViewController.m
//  05-图片水印
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"

@interface NJViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iv;

@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // -1.加载图片
//    UIImage *image = [UIImage imageNamed:@"me"];
    
    // 0.创建一个bitmap的上文
//    CGBitmapContextCreate
    /*
     size :指定将来创建出来的bitmap的大小
     opaque : YES:不透明  NO:透明
     scale: 缩放比例
     创建出来的bitmap就对应一个UIImage
     */
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200)     , NO , 0);
    
	// 1.获取bitmap上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.绘图
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    
    // 3.渲染
    CGContextStrokePath(ctx);
    
    // 4.获取生成的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.显示生成的图片到imageview
    self.iv.image = image;
    
    // 6.保存绘制好的图片到文件中
    // 先将图片转换为二进制数据, 然后再将图片写到文件中
//    UIImageJPEGRepresentation(image, 1)
    NSData *data = UIImagePNGRepresentation(image);
    
    [data writeToFile:@"/Users/apple/Desktop/abc.png" atomically:YES];
}


@end
