//
//  NJProductsViewController.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJProductsViewController.h"
#import "NJProduct.h"
#import "NJProductCell.h"

NSString * const ILId = @"cell";

@interface NJProductsViewController ()
{
    NSMutableArray *_products;
}
@end

@implementation NJProductsViewController

- (id)init
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置每一个各自的大小
    flow.itemSize = CGSizeMake(80, 80);
    
    // 水平方向上的间距 == 0
    flow.minimumInteritemSpacing = 0;
    
    // 垂直方向上的间距 ==
//    flow.minimumLineSpacing = 40;
    
    flow.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    return [self initWithCollectionViewLayout:flow];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"其他产品推荐";
    
    // 1.加载JSON
    NSArray *array = NJJson(product.json);
    
    // 2.创建产品模型
    _products = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        NJProduct *p = [NJProduct productWithDict:dict];
        [_products addObject:p];
    }
    
    // 3.注册
    UINib *nib = [UINib nibWithNibName:[NJProductCell xib] bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ILId];
    self.collectionView.backgroundColor = NJGlobalBg;
}

#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NJProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ILId forIndexPath:indexPath];
    
    cell.product = _products[indexPath.item];
    
    return cell;
}
@end
