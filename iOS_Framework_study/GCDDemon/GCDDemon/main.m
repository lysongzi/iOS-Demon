//
//  main.m
//  GCDDemon
//
//  Created by lysongzi on 16/2/26.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //测试代码
        GCDTest *test = [GCDTest new];
        //[test testSerialQueue];
        [test testConcurrentQueue];
        //[test testGroup];
        //[test testBarrier];
        //[test testAfter];
        //[test testApply];
        //[test testGCDTime];
        
        [NSThread sleepForTimeInterval:10];
    }
    return 0;
}
