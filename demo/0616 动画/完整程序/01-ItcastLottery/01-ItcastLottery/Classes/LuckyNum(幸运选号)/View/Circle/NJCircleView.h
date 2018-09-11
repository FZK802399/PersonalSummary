//
//  NJCircleView.h
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ILCircleTypeAstrology, // 星座
    ILCircleTypeAnimal // 生肖
} ILCircleType;

@interface NJCircleView : UIView
@property (nonatomic, assign) ILCircleType circleType;

+ (instancetype)circleView;
- (void)startRotate;
- (void)pauseRotate;
- (void)stopRotate;
@end