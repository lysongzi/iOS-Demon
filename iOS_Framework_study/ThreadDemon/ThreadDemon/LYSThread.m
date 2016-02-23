//
//  LYSThread.m
//  ThreadDemon
//
//  Created by lysongzi on 16/2/23.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "LYSThread.h"

@implementation LYSThread

//重写main方法，执行任务
-(void)main
{
    [self setName:@"LYSThread"];
    for (int i = 0; i < 100; i++) {
        NSLog(@"%zd ===> %@", i, [NSThread currentThread]);
    }
}

@end
