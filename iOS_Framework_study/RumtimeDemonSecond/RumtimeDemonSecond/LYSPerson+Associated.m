//
//  LYSPerson+Associated.m
//  RumtimeDemonSecond
//
//  Created by lysongzi on 16/3/5.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import "LYSPerson+Associated.h"

@implementation LYSPerson (Associated)

- (void)setAssociatedBust:(NSNumber *)associatedBust
{
    //设置关联对象
    objc_setAssociatedObject(self, @selector(associatedBust), associatedBust, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)associatedBust
{
    //得到关联对象
    return objc_getAssociatedObject(self, @selector(associatedBust));
}

- (void)setAssociatedCallBack:(CodingCallBack)associatedCallBack
{
    //设置关联对象
    objc_setAssociatedObject(self, @selector(associatedCallBack), associatedCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CodingCallBack)associatedCallBack
{
    //得到关联对象
    return objc_getAssociatedObject(self, @selector(associatedCallBack));
}

@end
