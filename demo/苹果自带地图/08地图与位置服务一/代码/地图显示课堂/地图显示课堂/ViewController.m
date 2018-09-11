//
//  ViewController.m
//  地图显示课堂
//
//  Created by GG on 16/5/22.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<MKMapViewDelegate>
{
    MKMapView *_mapView;
    
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * 让当前位置显示出来
     
     * 1、采用定位管理器获取到定位权限
     * 2、创建地图试图，并放在父试图上面
     * 3、设置追踪类型
     * 4、让地图显示当前用户位置
     
     * 5、设置显示区域
     */
    
    locationManager = [[CLLocationManager alloc]init];
    [locationManager requestAlwaysAuthorization];
    
    
    
    _mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    
    _mapView.delegate = self;
    
    [self.view addSubview:_mapView];
    
    //显示用户的位置
    _mapView.showsUserLocation = YES;
    
    //跟踪类型
    _mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    
    //地图类型
    _mapView.mapType = MKMapTypeHybrid;
    
    //userlocation获取到当前用户位置
//    NSLog(@"经纬度 %f %f",_mapView.userLocation.coordinate.longitude,_mapView.userLocation.coordinate.latitude);
    
//    //是否显示指南针,当跟踪类型是FollowWithHeading时，直接显示出来，否则旋转才能显示
//    _mapView.showsCompass = YES;
//    
//    //显示比例尺
//    _mapView.showsScale = YES;
//    
//    //显示交通
//    _mapView.showsTraffic = YES;
    
}


//位置发生改变调用该代理方法, 无法自动缩放到定位到的位置
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    //设置地图的中心点
    _mapView.centerCoordinate = userLocation.coordinate;
    
    //经纬度的跨度
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    
    //中心点
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
    
    //设置地图显示区域
    [_mapView setRegion:MKCoordinateRegionMake(center, span) animated:YES];
    
    
    /*
       例如：中国经纬度
     
       经度范围：73.33E 至 135.05E
       纬度范围：2.51N  至 53.33N
     
       centerlo =  (73+135)/2;
       centerla =   (2+53)/2;
     
       spanlo = (135-73);
       spanla = (53-3);
     
     */
    
//    _mapView.centerCoordinate = userLocation.coordinate;
//    
//    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(27.5, 104);
//    
//    MKCoordinateSpan span = MKCoordinateSpanMake(62, 50);
//    
//    
//    [_mapView setRegion:MKCoordinateRegionMake(center, span) animated:YES];
    

}






@end
