//
//  NSOperationTest.h
//  ThreadDemon
//
//  Created by lysongzi on 16/2/23.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOperationTest : NSObject

- (void)createByNSOperationQueue;
- (void)createByNSInvocationOperation;
- (void)createByNSBlockOperation;

- (void)testCumstomSubclass;
- (void)testDependency;

@end
