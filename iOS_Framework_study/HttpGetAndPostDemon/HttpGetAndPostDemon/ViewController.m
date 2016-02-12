//
//  ViewController.m
//  HttpGetAndPostDemon
//
//  Created by lysongzi on 16/1/28.
//  Copyright © 2016年 lysongzi. All rights reserved.
//
//  Http请求进行GET和POST请求
//

#import "ViewController.h"

@interface ViewController ()

//@property (strong, nonatomic) NSURLConnection *connections;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.connections = [[NSURLConnection alloc] init];
    
    //[self sendMySynchronous];
    [self sendMyAsynchronous];
}

- (void)sendMySynchronous
{
    
    NSMutableURLRequest *url = [[NSMutableURLRequest alloc] init];
    url.URL = [NSURL URLWithString:@"http://www.baidu.com"];
    url.HTTPMethod = @"GET";
    //url.HTTPMethod = @"POST";
    NSError *error;
    
    //发送同步请求
    NSData * data = [NSURLConnection sendSynchronousRequest:url returningResponse:nil error:&error];
    
    if (!error) {
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }
    else
    {
        NSLog(@"%@", error);
    }
}

- (void)sendMyAsynchronous
{
    
    NSMutableURLRequest *url = [[NSMutableURLRequest alloc] init];
    url.URL = [NSURL URLWithString:@"http://www.baidu.com"];
    url.HTTPMethod = @"GET";
    //url.HTTPMethod = @"POST";
    NSError *error;
    
    //发送同步请求
    [NSURLConnection sendAsynchronousRequest:url queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError)
    {
        if (!error)
        {
            //成果获取数据
            NSLog(@"%@", response);
            NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
        else
        {
            NSLog(@"%@", error);
        }
    }];
}

@end
