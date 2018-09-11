//
//  NJBaseSettingViewController.h
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJSettingGroup.h"
#import "NJSettingItem.h"
#import "NJSettingArrowItem.h"
#import "NJSettingSwitchItem.h"
#import "NJSettingLabelItem.h"
#import "NJSettingKeys.h"

@interface NJBaseSettingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_allGroups; // 所有的组模型
}
@property (nonatomic, weak, readonly) UITableView *tableView;
@end
