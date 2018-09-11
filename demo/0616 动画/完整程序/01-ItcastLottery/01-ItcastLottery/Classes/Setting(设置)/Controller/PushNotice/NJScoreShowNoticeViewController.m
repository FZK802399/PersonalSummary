//
//  ILScoreShowViewController.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-24.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "NJScoreShowNoticeViewController.h"

@interface NJScoreShowNoticeViewController ()
{
    NJSettingLabelItem *_startTime;
}
@end

@implementation NJScoreShowNoticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"比分直播设置";
    
    // 1.提醒我关注的比赛
    [self addNoticeGroup];
    
    // 2.起始时间
    [self addStartTimeGroup];
    
    // 3.结束时间
    [self addEndTimeGroup];
}

#pragma mark 起始时间
- (void)addStartTimeGroup
{
    __weak NJSettingLabelItem *startTime = [NJSettingLabelItem itemWithTitle:@"起始时间"];
    startTime.key = NJSettingScoreShowStartTime;
    if (startTime.text.length == 0) {
        startTime.text = @"00:00";
    }
    
    //    __unsafe_unretained  和 __weak 是等价的
    __weak NJScoreShowNoticeViewController *score = self;
    startTime.operation = ^{
        // 2.0.默认时间
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"HH:mm";
        NSDate *date = [fmt dateFromString:startTime.text];
        
        // 2.1.键盘
        UIDatePicker *dp = [[UIDatePicker alloc] init];
        dp.date = date;
        dp.datePickerMode = UIDatePickerModeTime;
        [dp addTarget:score action:@selector(startTimeChange:) forControlEvents:UIControlEventValueChanged];
        dp.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        dp.backgroundColor = [UIColor lightGrayColor];
        
        // 2.2.文本框
        UITextField *temp = [[UITextField alloc] init];
        temp.inputView = dp;
        
        // 2.3.添加temp
        [score.view addSubview:temp];
        
        // 2.4.叫出键盘
        [temp becomeFirstResponder];
    };
    _startTime = startTime;
    
    NJSettingGroup *startTimeGroup = [[NJSettingGroup alloc] init];
    startTimeGroup .items = @[startTime];
    startTimeGroup.header = @"只在以下时间接受比分直播";
    [_allGroups addObject:startTimeGroup];
}

#pragma mark 结束时间
- (void)addEndTimeGroup
{
    NJSettingLabelItem *endTime = [NJSettingLabelItem itemWithTitle:@"结束时间"];
    //    endTime.text = @"23:59";
    endTime.key = NJSettingScoreShowEndTime;
    if (endTime.text.length == 0) {
        endTime.text = @"23:59";
    }
    NJSettingGroup *endTimeGroup = [[NJSettingGroup alloc] init];
    endTimeGroup .items = @[endTime];
    [_allGroups addObject:endTimeGroup];
}

#pragma mark 提醒我关注的比赛
- (void)addNoticeGroup
{
    NJSettingSwitchItem *notice = [NJSettingSwitchItem itemWithTitle:@"提醒我关注的比赛"];
    notice.key = NJSettingScoreShowNoticeCareGame;
    NJSettingGroup *noticeGroup = [[NJSettingGroup alloc] init];
    noticeGroup .items = @[notice];
    noticeGroup.footer = @"当我关注的比赛比分发生变化时，通过小弹窗或推送进行提醒";
    [_allGroups addObject:noticeGroup];
}

#pragma mark 开始时间更改了
- (void)startTimeChange:(UIDatePicker *)dp
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    
    // 1.修改模型
    _startTime.text = [fmt stringFromDate:dp.date];
    
    // 2.刷新表格
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationNone];
}

@end