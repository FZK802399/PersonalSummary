//
//  NJThreeButton.m
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJThreeButton.h"

@interface NJThreeButton()
- (IBAction)selectType;
- (IBAction)selectCount;
- (IBAction)selectCategory;
@end

@implementation NJThreeButton

+ (instancetype)threeButton
{
    return [[NSBundle mainBundle] loadNibNamed:@"NJThreeButton" owner:nil options:nil][0];
}

- (IBAction)selectType {
}

- (IBAction)selectCount {
}

- (IBAction)selectCategory {
}
@end
