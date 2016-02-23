//
//  pthreadTest.m
//  ThreadDemon
//
//  Created by lysongzi on 16/2/23.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pthreadTest.h"

void * run(void *param)
{
    for (int i = 0; i < 1000; i++) {
        NSLog(@"%zd------->%@", i, [NSThread currentThread]);
    }
    return NULL;
}

//pthread方式创建线程
void newThread()
{
    //定义一个线程
    pthread_t thread;
    //创建一个线程
    //参数一：创建线程的指针
    //参数二：线程属性
    //参数三：线程执行的函数的指针
    //参数四：= =。不知道
    pthread_create(&thread, NULL, run, NULL);
    
    //创建第二个线程
    pthread_t thread2;
    pthread_create(&thread2, NULL, run, NULL);
}

