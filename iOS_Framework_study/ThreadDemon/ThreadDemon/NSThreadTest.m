//
//  NSThreadTest.m
//  ThreadDemon
//
//  Created by lysongzi on 16/2/23.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "NSThreadTest.h"

@implementation NSThreadTest

- (void) dynamicNewThread
{
    //创建一个线程实例
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    //启动线程
    [thread start];
}

-(void)staticNewThread
{
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
}

-(void)implicitNewThread
{
    [self performSelectorInBackground:@selector(run) withObject:nil];
}

- (void)run
{
    for (int i = 0; i < 100; i++) {
        NSLog(@"%zd ====> %@", i, [NSThread currentThread]);
    }
}

@end
