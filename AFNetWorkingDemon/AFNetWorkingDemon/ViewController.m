//
//  ViewController.m
//  AFNetWorkingDemon
//
//  Created by lysongzi on 16/1/28.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

//可能用来的请求数据
// http://api.openweathermap.org/data/2.5/forecast/daily?lat=39.907501&lon=116.397232&cnt=10
// http://h.hiphotos.baidu.com/image/pic/item/8d5494eef01f3a298a1c0a799c25bc315d607cb5.jpg

#import "ViewController.h"
#import "AFNetWorking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //发送GET请求
    //[self sendGetRequest];
    
    //发送POST请求
    [self sendPostRequest];
}

- (void)sendGetRequest
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"http://www.baidu.com" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
    {
        //请求返回的数据(二进制数据)
        NSLog(@"responseObject(二进制) = %@",responseObject);
        //转化二进制数据
        NSLog(@"responseObject = %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        //获取请求的头部信息
        NSLog(@"请求的头部信息 = %@", operation.request.allHTTPHeaderFields);
        //获取请求返回数据的头部信息
        NSLog(@"返回数据的头部信息 = %@", operation.response);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        //请求失败
        NSLog(@"%@", error);
    }];
}

- (void)sendPostRequest
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSDictionary *param = @{@"wd":@"天气"};
    
    [manager POST:@"http://www.baidu.com" parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         //请求返回的数据(二进制数据)
         NSLog(@"responseObject(二进制) = %@",responseObject);
         //转化二进制数据
         NSLog(@"responseObject = %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
         //获取请求的头部信息
         NSLog(@"请求的头部信息 = %@", operation.request.allHTTPHeaderFields);
         //获取请求返回数据的头部信息
         NSLog(@"返回数据的头部信息 = %@", operation.response);
         
     } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
         //请求失败
         NSLog(@"%@", error);
     }];
}

@end
