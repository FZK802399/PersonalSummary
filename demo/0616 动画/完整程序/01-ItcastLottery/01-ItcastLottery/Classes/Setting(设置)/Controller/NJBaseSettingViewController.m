//
//  NJBaseSettingViewController.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJBaseSettingViewController.h"
#import "NJSettingCell.h"

const int ILTableViewHeaderH = 18;

@interface NJBaseSettingViewController ()

@end

@implementation NJBaseSettingViewController

- (void)loadView
{
    _allGroups = [NSMutableArray array];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // 设置背景
    tableView.backgroundView = nil;
    tableView.backgroundColor = NJGlobalBg;
    // 分隔线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.sectionFooterHeight = 0;
    tableView.sectionHeaderHeight = ILTableViewHeaderH;
    
    if (iOS7) {
        tableView.contentInset = UIEdgeInsetsMake(ILTableViewHeaderH-35, 0, 0, 0);
    }
    
    self.view = tableView;
    
    _tableView = tableView;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _allGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NJSettingGroup *group = _allGroups[section];
    return group.items.count;
}

#pragma mark 每当有一个cell进入视野范围内就会调用，返回当前这行显示的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建一个ILSettingCell
    NJSettingCell *cell = [NJSettingCell settingCellWithTableView:tableView];
    
    // 2.取出这行对应的模型（ILSettingItem）
    NJSettingGroup *group = _allGroups[indexPath.section];
    cell.item = group.items[indexPath.row];
    cell.indexPath = indexPath;
    return cell;
}

#pragma mark 点击了cell后的操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 去除选中时的背景
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 0.取出这行对应的模型
    NJSettingGroup *group = _allGroups[indexPath.section];
    NJSettingItem *item = group.items[indexPath.row];
    
    // 1.取出这行对应模型中的block代码
    if (item.operation) {
        // 执行block
        item.operation();
        return;
    }
    
    // 2.检测有没有要跳转的控制器
    if ([item isKindOfClass:[NJSettingArrowItem class]]) {
        NJSettingArrowItem *arrowItem = (NJSettingArrowItem *)item;
        if (arrowItem.showVCClass) {
            UIViewController *vc = [[arrowItem.showVCClass alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark 返回每一组的header标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NJSettingGroup *group = _allGroups[section];
    
    return group.header;
}
#pragma mark 返回每一组的footer标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NJSettingGroup *group = _allGroups[section];
    
    return group.footer;
}

@end
