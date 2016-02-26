//
//  GCDTest.h
//  GCDDemon
//
//  Created by lysongzi on 16/2/26.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDTest : NSObject

- (void)testSerialQueue;
- (void)testConcurrentQueue;
- (void)testMainQueue;
- (void)testGlobalQueue;
- (void)testGroup;
- (void)testBarrier;
- (void)testAfter;
- (void)testApply;
- (void)testGCDTime;

+ (instancetype)sharedInstance;

@end
