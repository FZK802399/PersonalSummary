//
//  ViewController.m
//  地图-定位
//
//  Created by GG on 16/5/21.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "ViewController.h"
//1、导入框架
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
{
    //2. 声明全局的定位管理器对象，必须是全局的
    CLLocationManager *_locationManager;
    
    float allDistance;
    double allTime;
    
    CLLocation *lastLocation;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    /* 定位
     
     * 1、CoreLocation框架
     
     * 2、CLLocationManager: 定位管理器
     
     * 3、CLocation: 保存位置信息
     
     * 精简定位->GPS
     
        1、导入CoreLoaction
        2、创建定位管理器，需为全局变量
        3、获取定位授权，配置plist
        4、挂代理、遵守协议
        5、开始定位
        6、实现代理方法
     
     * 导航方向定位->磁性传感器，不需要定位授权
     
        1、导入CoreLocation
        2、创建定位管理器，需为全局变量
        3、挂代理遵守协议
        4、开始导航定位
        5、实现代理方法
     
     */
    
    //3. 实例化定位管理器对象
    _locationManager = [[CLLocationManager alloc ]init];
    
    //4. 判断手机是否打开定位服务
    
    BOOL isOpenLocationService = [CLLocationManager locationServicesEnabled];
    
    if (isOpenLocationService == NO) {
        
        NSLog(@"请到设置->隐私->定位服务里打开定位服务");
        
        return;
    }
    
    //5. 获取定位服务权限，并在info.plist进行相应配置
    [_locationManager requestWhenInUseAuthorization];
    
    //6. 设置定位精度和频率
    
      //精度
    _locationManager.desiredAccuracy = 10;
    
      //频率
    _locationManager.distanceFilter = 10;
    
    //7、挂代理，遵守协议
    _locationManager.delegate = self;
    
    //8. 开始定位
    [_locationManager startUpdatingLocation];
    

}

//9、实现代理方法， 定位成功

static int isFirst = 0;

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    //获取到代表当前位置信息的CLLocation对象
    CLLocation *curLocation = locations.lastObject;
    
//    NSLog(@"经度=%f \n 纬度=%f",curLocation.coordinate.longitude,curLocation.coordinate.latitude);
    
//    NSLog(@"海拔%f",curLocation.altitude);
    
    if (isFirst == 0) {
        
        isFirst = 1;
        
    }else{
        
       float distance = [curLocation distanceFromLocation:lastLocation];
        
        allDistance += distance;
        
       NSTimeInterval time =  fabs([curLocation.timestamp timeIntervalSinceDate:lastLocation.timestamp]);
        
        NSLog(@"间隔=%f",time
              );
        
        allTime += time;
        
    }
    
    NSLog(@"行驶了%fm 行驶了%f 速度%f",allDistance,allTime,allDistance/allTime);
    
    
    lastLocation = curLocation;
 
    
    
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"定位失败");
    
    
}



@end
