//
//  NJHtmlPage.h
//  01-ItcastLottery
//
//  Created by 李南江 on 14-5-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "title" : "如何充值？",
 "html" : "help.html",
 "id" : "howtorecharge"
 */
@interface NJHtmlPage : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;

+ (instancetype)htmlPageWithDict:(NSDictionary *)dict;
@end
