//
//  NJHelpViewController.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJHelpViewController.h"
#import "NJHtmlViewController.h"
#import "NJHtmlPage.h"
#import "NJNavigationController.h"

@interface NJHelpViewController ()
{
    NSMutableArray *_htmlPages;
}
@end

@implementation NJHelpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"帮助";
    
    // 1.加载JSON----help.json
    NSArray *array = NJJson(help.json);
    
    // 2.便利数组，创建所有的item
    _htmlPages = [NSMutableArray array];
    NSMutableArray *items = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        // 2.1.创建网页模型
        NJHtmlPage *hp = [NJHtmlPage htmlPageWithDict:dict];
        [_htmlPages addObject:hp];
        
        // 2.2.每一行cell对应的item
        NJSettingArrowItem *arrow = [NJSettingArrowItem itemWithTitle:hp.title];
        [items addObject:arrow];
    }
    
    // 3.添加一组
    NJSettingGroup *group = [NJSettingGroup groupWithItems:items];
    [_allGroups addObject:group];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 2.跳到html控制器
    NJHtmlViewController *htmlVc = [[NJHtmlViewController alloc] init];
    htmlVc.htmlPage = _htmlPages[indexPath.row];
    
    NJNavigationController *nav = [[NJNavigationController alloc] initWithRootViewController:htmlVc];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
