//
//  ViewController.m
//  自定义大头针
//
//  Created by GG on 16/5/22.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "AnnotationModel.h"
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
    
    _mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_mapView];
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    _mapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc]init];
    [locationManager requestAlwaysAuthorization];
    
    /*
     * 大头针显示的原理
     
     * 1、找到当前用户位置的数据模型
     
     * 2、往试图上添加数据模型
     
     * 3、调用代理方法将数据模型包装到大头针试图上面，然后返回该大头针试图
     */
    
    //添加长按手势
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAn:)];
    [_mapView addGestureRecognizer:longGesture];
    
    
    
    
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
       
        
        CLGeocoder *geocoder = [[CLGeocoder alloc]init];
        
        [geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
           
            CLPlacemark *placeMark = placemarks.lastObject;
            
            userLocation.title = placeMark.name;
            
            
        }];
        
    });
    
    
}


//将大头针数据模型添加到试图上面时调用
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    //判断当前大头针数据模型是不是用户位置的数据模型
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        
        
        
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
        
        if (annotationView == nil) {
            
            //将数据模型包装到大头针试图上面
            annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
        }
        
        annotationView.image = [UIImage imageNamed:@"user"];
        
        //显示辅助试图
        annotationView.canShowCallout = YES;
        
        //大头针拖动
        annotationView.draggable = YES;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 40, 40);
        [btn setBackgroundImage:[UIImage imageNamed:@"vip"] forState:UIControlStateNormal];
        
        annotationView.leftCalloutAccessoryView = btn;
        
        
//        annotationView.rightCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"电话"]];
//
//        annotationView.detailCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"vip"]];
//        
        
        
        return annotationView;
        
        
        
        
    }
    
    return nil;

    
    
    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    
    NSLog(@"点击辅助图标");
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    NSLog(@"===");
}



- (void)longAn:(UILongPressGestureRecognizer *)longGesture{
    
    if (longGesture.state != UIGestureRecognizerStateBegan) {
        
        return;
    }
    
    CGPoint point = [longGesture locationInView:longGesture.view];
    
    CLLocationCoordinate2D coordinate =  [_mapView convertPoint:point toCoordinateFromView:longGesture.view];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        
        
        CLGeocoder *geocoder = [[CLGeocoder alloc]init];
        
        CLLocation *location = [[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude];

        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            CLPlacemark *placeMark = placemarks.lastObject;
            
            AnnotationModel *model = [[AnnotationModel alloc]init];
            
            model.coordinate = coordinate;
            
            model.title = placeMark.name;
            
            
            [_mapView addAnnotation:model];
            
            
            
        }];
        
    });

    
    
    
    
}



@end
