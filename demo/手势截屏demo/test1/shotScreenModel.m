//
//  shotScreenModel.m
//  截屏
//
//  Created by PYC/Mr.ma on 14-7-7.
//  Copyright (c) 2014年 PYC\MFW. All rights reserved.
//

#import "shotScreenModel.h"

@implementation shotScreenModel
//截全屏
-(UIImage*)imageFromView:(UIView*)theView andDelegate:(id<passImageDelegate>)delegate
{
    
    self.delegate = delegate;
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.delegate passImage:theImage];
    return theImage;
    
}

//根据 rect 截屏
-(UIImage*)imageFromView:(UIView *)theView atFrame:(CGRect)r andDelegate:(id<passImageDelegate>)delegate
{
    self.delegate = delegate;
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.delegate passImage:theImage];
    return  theImage;
}

@end


