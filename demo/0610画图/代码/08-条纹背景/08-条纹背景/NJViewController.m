//
//  NJViewController.m
//  08-条纹背景
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJViewController.h"

@interface NJViewController ()
@property (weak, nonatomic) IBOutlet UITextView *contentView;
- (IBAction)preBtnClick:(id)sender;
- (IBAction)nextBtnClick:(id)sender;

@property (nonatomic, assign) int index;

@end

@implementation NJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//
    
    // 1.生成一张以后用于平铺的小图片
    CGSize size = CGSizeMake(self.view.frame.size.width, 44);
    UIGraphicsBeginImageContextWithOptions(size , NO, 0);
    
    // 2.画矩形
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat height = 44;
    CGContextAddRect(ctx, CGRectMake(0, 0, self.view.frame.size.width, height));
    [[UIColor redColor] set];
    CGContextFillPath(ctx);
    
    // 3.画线条
    
    CGFloat lineWidth = 2;
    CGFloat lineY = height - lineWidth;
    CGFloat lineX = 0;
    CGContextMoveToPoint(ctx, lineX, lineY);
    CGContextAddLineToPoint(ctx, 320, lineY);
    [[UIColor blackColor] set];
    CGContextStrokePath(ctx);
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIColor *myColor = [UIColor colorWithPatternImage:image];
    self.contentView.backgroundColor = myColor;

}

- (void)test
{
    // 1.生成一张以后用于平铺的小图片
    CGSize size = CGSizeMake(self.view.frame.size.width, 44);
    UIGraphicsBeginImageContextWithOptions(size , NO, 0);
    
    // 2.画矩形
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat height = 44;
    CGContextAddRect(ctx, CGRectMake(0, 0, self.view.frame.size.width, height));
    [[UIColor redColor] set];
    CGContextFillPath(ctx);
    
    // 3.画线条
    
    CGFloat lineWidth = 2;
    CGFloat lineY = height - lineWidth;
    CGFloat lineX = 0;
    CGContextMoveToPoint(ctx, lineX, lineY);
    CGContextAddLineToPoint(ctx, 320, lineY);
    [[UIColor blackColor] set];
    CGContextStrokePath(ctx);
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    /*
     // 2.将图片写到文件中
     NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"aaa.png"];
     NSLog(@"%@", path);
     
     NSData *data = UIImagePNGRepresentation(image);
     [data writeToFile:path atomically:YES];
     */
    
    
    //    UIImage *image = [UIImage imageNamed:@"me"];
    //    UIColor *myColor = [UIColor colorWithPatternImage:image];
    //    self.view.backgroundColor = myColor;
}

// 今天不要求掌握以下内容
- (IBAction)preBtnClick:(id)sender
{
    self.index--;
    
    self.contentView.text = [NSString stringWithFormat:@"第%d页", self.index];
    
    CATransition *ca = [[CATransition alloc] init];
    ca.type = @"cube";
    
    
    [self.contentView.layer addAnimation:ca forKey:nil];
}

- (IBAction)nextBtnClick:(id)sender
{
    self.index++;
    
    self.contentView.text = [NSString stringWithFormat:@"第%d页", self.index];
}
@end
