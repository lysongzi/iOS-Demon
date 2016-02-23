//
//  main.m
//  ThreadDemon
//
//  Created by lysongzi on 16/2/22.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "pthreadTest.h"
#import "NSthreadTest.h"
#import "LYSThread.h"
#import "NSOperationTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //****************** pthread方式创建线程 ******************
        //newThread();
        
        //****************** NSThread方式创建线程 ******************
        //NSThreadTest *test = [[NSThreadTest alloc] init];
        //[test dynamicNewThread];
        //[test staticNewThread];
        //[test implicitNewThread];
        
        //自定义的NSThread子类
        //LYSThread *thread = [[LYSThread alloc] init];
        //[thread start];
        
        //****************** NSOperation方式创建线程 ******************
        NSOperationTest *testOperation = [[NSOperationTest alloc] init];
        //不同创建Operation方式
        //[testOperation createByNSOperationQueue];
        //[testOperation createByNSInvocationOperation];
        //[testOperation createByNSBlockOperation];
        
        //测试自定义NSOPeration子类
        //[testOperation testCumstomSubclass];
        //测试NSOperation之间的依赖
        [testOperation testDependency];
        
        //主线程休眠2秒
        [NSThread sleepForTimeInterval:2000];
    }
    return 0;
}

