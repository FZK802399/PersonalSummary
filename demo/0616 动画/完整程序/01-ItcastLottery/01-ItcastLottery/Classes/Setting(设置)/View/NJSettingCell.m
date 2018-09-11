//
//  NJSettingCell.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJSettingCell.h"
#import "NJSettingItem.h"
#import "NJSettingSwitchItem.h"
#import "NJSettingArrowItem.h"
#import "NJSettingLabelItem.h"

const int ILCellMargin = 10;

@interface NJSettingCell()
{
    UIImageView *_arrow;
    UISwitch *_switch;
    UILabel *_label;
    UIView *_divider;
}
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation NJSettingCell

+ (instancetype)settingCellWithTableView:(UITableView *)tableView
{
    // 0.用static修饰的局部变量，只会初始化一次
    static NSString *ID = @"Cell";
    
    // 1.拿到一个标识先去缓存池中查找对应的Cell
    NJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果缓存池中没有，才需要传入一个标识创建新的Cell
    if (cell == nil) {
        cell = [[NJSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.tableView = tableView;
    }
    
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.设置背景
        [self setupBg];
        
        // 2.设置子控件属性
        [self setupSubviews];
        
        // 3.添加分隔线
        [self setupDivider];
    }
    return self;
}

#pragma mark 分隔线
- (void)setupDivider
{
    _divider = [[UIView alloc] init];
    _divider.backgroundColor = NJColor(225, 225, 225);
    [self.contentView addSubview:_divider];
}

#pragma mark 设置行号
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    _divider.hidden = indexPath.row == 0;
}

#pragma mark 设置子控件属性
- (void)setupSubviews
{
    // 1.文字颜色
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    
    // 2.文字大小
    self.textLabel.font = [UIFont systemFontOfSize:15];
    self.detailTextLabel.font = [UIFont systemFontOfSize:13];
    self.detailTextLabel.textColor = [UIColor darkGrayColor];
}

#pragma mark 设置背景
- (void)setupBg
{
    // 1.默认
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bg;

    // 2.选中
    UIView *selectedBg = [[UIView alloc] init];
    selectedBg.backgroundColor = NJColor(237, 233, 218);
    self.selectedBackgroundView = selectedBg;
}

- (void)setItem:(NJSettingItem *)item
{
    _item = item;
    
    // 设置数据
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subtitle;
    
    if ([item isKindOfClass:[NJSettingArrowItem class]]) {
        [self settingArrow];
    } else if ([item isKindOfClass:[NJSettingSwitchItem class]]) {
        [self settingSwitch];
    } else if ([item isKindOfClass:[NJSettingLabelItem class]]) {
        [self settingLabel];
    } else {
        // 什么也没有，清空右边显示的view
        self.accessoryView = nil;
        // 用默认的选中样式
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

- (void)setFrame:(CGRect)frame
{
    if (!iOS7) {
        frame.origin.x = - ILCellMargin;
        frame.size.width = [UIScreen mainScreen].bounds.size.width + ILCellMargin * 2;
    }
    [super setFrame:frame];
}

#pragma mark 当cell的宽高改变了就会调用
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _divider.frame = CGRectMake(self.textLabel.frame.origin.x, 0, self.contentView.frame.size.width + 100, 1.2);
    
    if (iOS7) return;
    
    // 右边控件的frame
    CGRect accessF = self.accessoryView.frame;
    accessF.origin.x = self.frame.size.width - accessF.size.width - ILCellMargin * 2;
    self.accessoryView.frame = accessF;
}

#pragma mark 设置右边的文本标签
- (void)settingLabel
{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.bounds = CGRectMake(0, 0, 100, self.frame.size.height);
        _label.textAlignment = NSTextAlignmentRight;
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = NJColor(173, 69, 14);
        _label.font = [UIFont systemFontOfSize:13];
        _label.text = @"00:00";
    }
    
    // 右边显示标签
    self.accessoryView = _label;
    // 用默认的选中样式
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}

#pragma mark 设置右边的开关
- (void)settingSwitch
{
    if (_switch == nil) {
        _switch = [[UISwitch alloc] init];
        [_switch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    
    NJSettingSwitchItem *switchItem = (NJSettingSwitchItem *)_item;
    _switch.on = !switchItem.isOff;
    
    // 右边显示开关
    self.accessoryView = _switch;
    // 禁止选中
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)switchChange
{
    NJSettingSwitchItem *switchItem = (NJSettingSwitchItem *)_item;
    switchItem.off = !_switch.isOn;
}

#pragma mark 设置右边的箭头
- (void)settingArrow
{
    if (_arrow == nil) {
        _arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    
    // 右边显示箭头
    self.accessoryView = _arrow;
    // 用默认的选中样式
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}
@end
