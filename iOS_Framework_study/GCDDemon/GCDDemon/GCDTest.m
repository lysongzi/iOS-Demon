//
//  GCDTest.m
//  GCDDemon
//
//  Created by lysongzi on 16/2/26.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "GCDTest.h"

@interface GCDTest ()

@end

@implementation GCDTest

+(instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id _instance;
    
    if (!_instance) {
        dispatch_once(&once, ^{
            _instance = [[self alloc] init];;
        });
    }
    
    return _instance;
}

//创建串行队列
-(void)testSerialQueue
{
    //创建串行队列,传入参数为DISPATCH_QUEUE_SERIAL
    dispatch_queue_t serialQueue = dispatch_queue_create("com.lysongzi.serial", DISPATCH_QUEUE_SERIAL);
    
    //同步执行队列中的任务，会立即在当前线程执行该任务
    dispatch_sync(serialQueue, ^{
        NSLog(@"这里是同步执行的串行队列01。===> %@", [NSThread currentThread]);
    });
    
    //异步执行任务，会新开一个线程，多个任务按顺序执行
    dispatch_async(serialQueue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"串行01 ===> %d ===> %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_sync(serialQueue, ^{
        NSLog(@"这里是同步执行的串行队列02。===> %@", [NSThread currentThread]);
    });
    
    dispatch_async(serialQueue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"串行02 ===> %d ===> %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(serialQueue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"串行03 ===> %d ===> %@", i, [NSThread currentThread]);
        }
    });
}

//创建并发队列
-(void)testConcurrentQueue
{
    //创建并发队列，传入参数为DISPATCH_QUEUE_CONCURRENT
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.lysongzi.concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    //同步执行队列中的任务，会立即执行该任务
    dispatch_sync(concurrentQueue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"并发同步01 ===> %d ===> %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_sync(concurrentQueue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"并发同步02 ===> %d ===> %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(concurrentQueue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"并发异步01 ===> %d ===> %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(concurrentQueue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"并发异步02 ===> %d ===> %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(concurrentQueue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"并发异步03 ===> %d ===> %@", i, [NSThread currentThread]);
        }
    });
}

-(void)testMainQueue
{
    //获取主线程队列，在主队列中的任务都将在主线程中执行
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
}

-(void)testGlobalQueue
{
    //获取全局队列，全局队列为并发队列
    //参数1：队列优先级
    //参数2：目前无用，一般传入0
    
    //队列优先级主要有下面几种
    //DISPATCH_QUEUE_PRIORITY_HIGH 2 ,优先级高
    //DISPATCH_QUEUE_PRIORITY_DEFAULT 0 ,默认优先级，中
    //DISPATCH_QUEUE_PRIORITY_LOW -2 ,优先级低
    //DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN ,后台模式-优先级最低
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

-(void)testGroup
{
    //将任务添加到队列组后，当组中所有任务都执行完毕后
    //队列组会向我们发出通知，可以再该方法中执行特定任务。
    //特别需要注意的一点就是，是在该组中所有的队列的所有的任务都执行完才会调用特定队列的notify方法的
    //如果该组有多个队列，则所有队列的notify将要在所有队列的任务都执行完时才会被调用
    
    //创建一个队列组
    dispatch_group_t group = dispatch_group_create();
    
    //自定义一个串行队列
    dispatch_queue_t myQueue = dispatch_queue_create("com.lysongzi.myqueue", DISPATCH_QUEUE_SERIAL);
    
    //获取全局队列
    dispatch_queue_t gloabalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //添加异步执行的任务,组里的任务都是异步执行的
    dispatch_group_async(group, myQueue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"group-queue01 ==> %d ==> %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, gloabalQueue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"group-queue02-thread01 ==> %d ==> %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, gloabalQueue, ^{
        for (int i = 0; i < 6; i++) {
            NSLog(@"group-queue02-thread02 ==> %d ==> %@", i, [NSThread currentThread]);
        }
    });
    
    //设置任务执行完后通知执行的内容
    //测试结果可知，会在该组中的相应队列的最后一个执行完的任务所在线程执行这个通知的方法。
    dispatch_group_notify(group, myQueue, ^{
        NSLog(@"Group in mainQueue finish. %@", [NSThread currentThread]);
    });
    
    dispatch_group_notify(group, gloabalQueue, ^{
        NSLog(@"Group in gloabalQueue finish. %@", [NSThread currentThread]);
    });
}

- (void)testBarrier
{
    dispatch_queue_t queue = dispatch_queue_create("com.lysongzi.barrier.concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 15; i++) {
            NSLog(@"before barrier01 ==> %d ==> %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 15; i++) {
            NSLog(@"before barrier02 ==> %d ==> %@", i, [NSThread currentThread]);
        }
    });
    
    //创建一个barrier任务，此后添加的任务需要在该任务执行完之后才会开始执行
    dispatch_barrier_async(queue, ^{
        NSLog(@"This is barrier task");
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 15; i++) {
            NSLog(@"after barrier01 ==> %d ==> %@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 15; i++) {
            NSLog(@"after barrier02 ==> %d ==> %@", i, [NSThread currentThread]);
        }
    });
}

-(void)testAfter
{
    NSLog(@"%@", [NSDate new]);
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(start, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"延迟执行的任务.");
        NSLog(@"%@", [NSDate new]);
    });
}

-(void)testApply
{
    //参数一：迭代次数
    //参数二：任务队列
    //参数三：迭代执行的代码块
    //迭代是异步的
    dispatch_apply(10, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index) {
        NSLog(@"apply %zu.", index);
    });
}

-(void)testGCDTime
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建一个定时起源
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    //设置回调时间间隔
    int64_t interval = (int64_t)(1 * NSEC_PER_SEC);
    //设置定时器开始时间
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC));
    
    //启动计时器
    //参数1：timer
    //参数2：开始时间
    //参数3：时间间隔
    //参数4：0
    dispatch_source_set_timer(source, start, interval, 0);
    
    //设置回调事件，即每次定时器触发的处理时间
    dispatch_source_set_event_handler(source, ^{
        static int number = 0;
        NSLog(@"%d", number);
        
        number++;
        //运行到第6秒则取消计时器
        if (number == 6) {
            dispatch_source_cancel(source);
            NSLog(@"Cancle timer.");
        }
    });
    
    //启动定时器
    dispatch_resume(source);
}

@end
