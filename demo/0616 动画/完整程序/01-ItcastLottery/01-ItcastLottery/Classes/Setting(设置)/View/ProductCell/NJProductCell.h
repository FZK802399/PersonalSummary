//
//  NJProductCell.h
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NJProduct;
@interface NJProductCell : UICollectionViewCell
+ (NSString *)xib;

@property (nonatomic, strong) NJProduct *product;
@end
