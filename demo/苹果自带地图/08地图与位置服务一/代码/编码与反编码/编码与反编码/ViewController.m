//
//  ViewController.m
//  编码与反编码
//
//  Created by GG on 16/5/21.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    /*
     * 编码与反编码
     
     * CLGeocoder ->CoreLocation框架，实现编码与反编码
     
     * CLPlaceMark -> CoreLocation框架，存放地标信息

     * PS：编码与反编码较耗性能，建议放到子线程执行
     
     */
    
    [self geocoder:@"郑州科技学院"];
    
    CLLocationCoordinate2D coor;
    
    
    coor.latitude = 39.969237;
    coor.longitude = 116.533045;
    
    [self reverseGeoCoder:coor];
    
}

- (void)reverseGeoCoder:(CLLocationCoordinate2D )coor{
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
       
        CLGeocoder *reverseGeocoder = [[CLGeocoder alloc]init];
        
        CLLocation *location = [[CLLocation alloc]initWithLatitude:coor.latitude longitude:coor.longitude];
    
        [reverseGeocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
           
            CLPlacemark *placemark = placemarks.lastObject;
            
            NSLog(@"名字%@",placemark.name);
            
            
            NSLog(@"地理信息=%@",placemark.addressDictionary);
            
            
        }];
        
        
        
        
        
        
        
    });
    
    
}


- (void)geocoder:(NSString *)name{
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
       
        //创建一个编码对象
        CLGeocoder *geocoder = [[CLGeocoder alloc]init];
        
        //编码
        [geocoder geocodeAddressString:name completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
           
            CLPlacemark *placeMark = placemarks.lastObject;
            
            NSLog(@"经纬度=%f %f",placeMark.location.coordinate.longitude,placeMark.location.coordinate.latitude);
            
            NSLog(@"地址信息字典=%@",placeMark.addressDictionary);
            
        }];
        
        
        
        
    });
    
    
    
}


@end
