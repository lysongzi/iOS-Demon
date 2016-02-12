//
//  ViewController.m
//  DelayPerformSelector
//
//  Created by lysongzi on 16/1/29.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //第一种方法
    //在主线程执行，否则无效；非阻塞；无法取消
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.0];
    
    //第二种方法
    //主线程中执行，否则无效；非阻塞；可以调用invalidte方法取消
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(delayMethod) userInfo:nil repeats:NO];
    
    //第三种方法
    //可选择执行的线程；非阻塞；无法取消
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [self delayMethod];
    });
    
    //第四种方法
    //主线程子线程都可以；阻塞；无法取消
    [NSThread sleepForTimeInterval:1.0];
    [self delayMethod];
}

- (void)delayMethod
{
    NSLog(@"Excute.");
}

@end
