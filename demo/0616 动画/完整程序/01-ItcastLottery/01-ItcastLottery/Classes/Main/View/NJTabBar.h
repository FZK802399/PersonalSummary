//
//  NJTabBar.h
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NJTabBar;

@protocol NJTabBarDelegate <NSObject>

@optional
- (void)tabBar:(NJTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to;

@end

@interface NJTabBar : UIView
- (void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon;

@property (nonatomic, weak) id<NJTabBarDelegate> delegate;
@end
