//
//  LYSSingletonObject.m
//  SingletonNormalDemon
//
//  Created by lysongzi on 16/2/3.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "LYSSingletonObject.h"

static LYSSingletonObject *instance;

@implementation LYSSingletonObject

+(LYSSingletonObject *)sharedInstance
{
    if (!instance) {
        instance = [[self alloc] init];
    }
    
    return instance;
}

@end
