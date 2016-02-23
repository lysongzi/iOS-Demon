//
//  NSOperationTest.m
//  ThreadDemon
//
//  Created by lysongzi on 16/2/23.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "NSOperationTest.h"
#import "LYSOperation.h"

@interface NSOperationTest ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end


@implementation NSOperationTest

-(instancetype)init
{
    self = [super init];
    if (self) {
        _queue = [[NSOperationQueue alloc] init];
        //设置最大可以并发执行5个Operation
        [_queue setMaxConcurrentOperationCount:5];
    }
    return self;
}

-(void)createByNSOperationQueue
{
    [self.queue addOperationWithBlock:^{
        NSLog(@"这是NSOperationQueue直接使用block创建的Operation。");
    }];
}

-(void)createByNSInvocationOperation
{
    //方法一，创建执行特定方法的Operation
    NSInvocationOperation *operation =
        [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
    [self.queue addOperation:operation];
    
    //方法二，创建NSInvocation对象，并设置其相应参数，在用于创建NSInvocationOperation实例
    NSInvocation *invocation =
        [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:@selector(run)]];
    //设置selector属性
    [invocation setSelector:@selector(run)];
    //设置target属性
    [invocation setTarget:self];
    //创建实例
    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc] initWithInvocation:invocation];
    [self.queue addOperation:operation2];
}

-(void)createByNSBlockOperation
{
    //创建实例
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"%zd ===> %@", i, [NSThread currentThread]);
        }
    }];
    //添加到队列中
    [self.queue addOperation:operation];
}

-(void)testCumstomSubclass
{
    LYSOperation *operation = [[LYSOperation alloc] init];
    [self.queue addOperation:operation];
}

- (void)testDependency
{
    NSBlockOperation *operationA = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"以来测试 ===> 任务A");
    }];
    
    NSBlockOperation *operationB = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"以来测试 ===> 任务B");
    }];
    
    NSBlockOperation *operationC = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"以来测试 ===> 任务C");
    }];
    
    //设置A依赖于B，B依赖于C
    [operationA addDependency:operationB];
    [operationB addDependency:operationC];
    
    //添加Operation到队列中
    [self.queue addOperations:@[operationA, operationB, operationC] waitUntilFinished:NO];
}

- (void)run
{
    for (int i = 0; i < 100; i++) {
        NSLog(@"%zd ===> %@", i, [NSThread currentThread]);
    }
}

@end
