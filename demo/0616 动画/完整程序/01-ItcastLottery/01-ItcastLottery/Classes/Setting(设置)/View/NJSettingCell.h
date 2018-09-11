//
//  NJSettingCell.h
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NJSettingItem;
@interface NJSettingCell : UITableViewCell
@property (nonatomic, strong) NJSettingItem *item;
@property (nonatomic, strong) NSIndexPath *indexPath;

+ (instancetype)settingCellWithTableView:(UITableView *)tableView;
@end
