//
//  NJProduct.h
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJProduct : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

+ (instancetype)productWithDict:(NSDictionary *)dict;
@end
