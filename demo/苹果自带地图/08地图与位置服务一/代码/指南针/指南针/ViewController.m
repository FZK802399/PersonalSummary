//
//  ViewController.m
//  指南针
//
//  Created by GG on 16/5/21.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
{
    UIImageView *imageView;
    
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 320, 320)];
    
    imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"指南针.jpg"];
    [self.view addSubview:imageView];
    
    
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    
    [locationManager startUpdatingHeading];

}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    
    if (newHeading.headingAccuracy<0) {
        
        NSLog(@"导航方向定位服务不可用");
        
        return;
    }
    
    //角度
    CLLocationDirection direction = newHeading.magneticHeading;
    
    //角度转弧度
    float cor = direction /180 * M_PI;
    
    //动画旋转
    [UIView animateWithDuration:0.5 animations:^{
       
        imageView.transform = CGAffineTransformRotate(imageView.transform, cor);
        
    }];
    
    
    
}



@end
