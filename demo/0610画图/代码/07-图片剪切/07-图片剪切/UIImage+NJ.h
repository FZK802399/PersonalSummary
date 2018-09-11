//
//  UIImage+NJ.h
//  07-图片剪切
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NJ)
/**
 *  生成头像
 *
 *  @param icon   头像图片名称
 *  @param border 头像边框大小
 *  @param color  头像边框的颜色
 *
 *  @return 生成好的头像
 */
+ (instancetype)imageWithIcon:(NSString *)icon border:(NSInteger)border color:(UIColor *)color;
@end
