//
//  ViewController.m
//  GetDeviceIPAddress
//
//  Created by lysongzi on 16/1/28.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"

#import <ifaddrs.h>
#import <arpa/inet.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", [self getDeviceIp]);
    NSLog(@"%@", [[[NSUUID alloc] init] UUIDString]);
}

- (NSString *)getDeviceIp
{
    NSString *ip = @"Error";
    struct ifaddrs *interfaces = nil;
    struct ifaddrs *temp_addr = nil;
    
    int success = getifaddrs(&interfaces);
    //获取地址成功
    if (!success)
    {
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    ip = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;  
        }
    }
    
    freeifaddrs(interfaces);
    return ip;
}

@end
