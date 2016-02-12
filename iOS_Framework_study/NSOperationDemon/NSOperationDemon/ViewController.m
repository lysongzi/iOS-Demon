//
//  ViewController.m
//  NSOperationDemon
//
//  Created by lysongzi on 16/2/2.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"
#import "LYSOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建一个NSOperationQueue
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //块结构执行任务
    [queue addOperationWithBlock:^{
        NSLog(@"这是以块结构创建的任务.");
        [NSThread sleepForTimeInterval:5];
        NSLog(@"块结构任务执行完毕.");
    }];
    
    //创建自定义的NSOperation子类
    LYSOperation *task1 = [[LYSOperation alloc] init];
    task1.id = 1;
    //设置权限级别
    [task1 setQueuePriority:NSOperationQueuePriorityVeryHigh];
    //设置完成后回调,这里很神奇，居然在结束前调用了？？？
    [task1 setCompletionBlock:^{
        NSLog(@"Task1的setCompletionBlock");
    }];
    
    LYSOperation *task2 = [[LYSOperation alloc] init];
    task2.id = 2;
    
    LYSOperation *task3 = [[LYSOperation alloc] init];
    task3.id = 3;
    
    //设置task3依赖于task2,即task3将在task2任务结束后执行
    [task3 addDependency:task2];
    
    //将所有任务添加到队列中
    [queue addOperation:task1];
    [queue addOperation:task2];
    [queue addOperation:task3];
    
    //结束所有任务
    //[queue cancelAllOperations];
}

@end
