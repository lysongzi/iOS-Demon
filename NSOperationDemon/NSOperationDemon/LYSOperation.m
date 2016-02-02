//
//  LYSOperation.m
//  NSOperationDemon
//
//  Created by lysongzi on 16/2/2.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "LYSOperation.h"

@implementation LYSOperation

/**
 *  执行任务的代码
 */
- (void)main
{
    NSLog(@"任务%ld: 开始执行.", self.id);
    [NSThread sleepForTimeInterval:2];
    NSLog(@"任务%ld: 结束执行.", self.id);
}

@end
