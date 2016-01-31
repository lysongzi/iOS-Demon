//
//  ViewController.m
//  CoreLocationTest
//
//  Created by lysongzi on 16/1/24.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted
        || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        NSLog(@"应用不可以使用定位服务.");
        return;
    }
    
    [self initLocation];
    
    //如果是IOS请求获取权限
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
    {
        //请求获取用户定位服务权限
        [self.manager requestWhenInUseAuthorization];
        NSLog(@"请求定位服务.");
    }
    
    //启动定位服务
    [self.manager startUpdatingLocation];
    NSLog(@"开始定位服务.");
}

- (void)initLocation
{
    //懒加载
    if (!self.manager)
    {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
        self.manager.desiredAccuracy = kCLLocationAccuracyBest;
        self.manager.distanceFilter = 10;
    }
}

#pragma mark CLLocationManagerDelegate委托实现


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //获取最新定位信息
    CLLocation *location = [locations lastObject];
    
    if (location.horizontalAccuracy > 0)
    {
        NSLog(@"最新位置：%f %f, 海拔高度：%f", location.coordinate.latitude, location.coordinate.longitude, location.altitude);
        
        //定位成功，关闭定位服务
        [self.manager stopUpdatingLocation];
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] == kCLErrorLocationUnknown) {
        NSLog(@"获取定位失败.");
    }
    else if ([error code] == kCLErrorHeadingFailure){
        NSLog(@"获取朝向信息失败.");
    }
    else if ([error code] == kCLErrorDenied){
        NSLog(@"用户拒绝访问定位服务.");
    }
}

@end
