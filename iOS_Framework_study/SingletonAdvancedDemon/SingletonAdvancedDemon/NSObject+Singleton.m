//
//  NSObject+Singleton.m
//  SingletonAdvancedDemon
//
//  Created by lysongzi on 16/2/3.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "NSObject+Singleton.h"

@implementation NSObject (Singleton)

static NSMutableDictionary *dictionary;
id instance;

+(instancetype)sharedInstance
{
    //进行同步控制，确保只进行一次实例的初始化
    //非多线程情况下可以不需要这一步
    @synchronized(self)
    {
        if (!dictionary) {
            dictionary = [[NSMutableDictionary alloc] init];
        }
        
        NSString *className = NSStringFromClass([self class]);
        if (className)
        {
            //先从字典中查询是否已有该类的实例
            instance = dictionary[className];
            
            //如果没有该类实例，则创建一个实例，并存储到字典中
            if (!instance) {
                instance = [[[self class] alloc] init];
                dictionary[className] = instance;
            }
        }
    }
    
    return instance;
}

@end
