//
//  AnnotationModel.h
//  自定义大头针
//
//  Created by GG on 16/5/22.
//  Copyright © 2016年 GG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

/*
 * 创建大头针数据模型类
 
 * 1、导入框架
 
 * 2、遵守大头针模型的协议 MKAnnotation
 
 * 3、重写三个属性
 
 */

@interface AnnotationModel : NSObject<MKAnnotation>

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *subtitle;

@end
