//
//  NJTabBar.h
//  09-彩票(lottery)
//
//  Created by apple on 14-6-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NJTabBarDelegate <NSObject>
/**
 *  @param from 从哪个视图(视图索引)
 *  @param to   到哪个视图(视图索引)
 */
- (void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface NJTabBar : UIView

@property (nonatomic, weak) id<NJTabBarDelegate> delegate;

/**
 *  提供给外界创建按钮
 *
 *  @param norName 默认状态的图片
 *  @param disName 高亮状态的图片
 */
- (void)addTabBarButtonWithNormalImageName:(NSString *)norName andDisableImageName:(NSString *)disName;

@end
