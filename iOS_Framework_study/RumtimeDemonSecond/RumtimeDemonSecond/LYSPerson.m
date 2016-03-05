//
//  LYSPerson.m
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

#import "LYSPerson.h"

@implementation LYSPerson

- (NSDictionary *)allProperties
{
    unsigned int count = 0;
    
    //获取类的所有属性，如果没有属性则count = 0
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    
    for (int i = 0; i < count; i++) {
        //获取属性的名称和值
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        
        if (propertyValue) {
            resultDict[name] = propertyValue;
        }
        else{
            resultDict[name] = @"字典的key对应的value不能为nil";
        }
    }
    
    //释放获取的属性数组指针
    free(properties);
    
    return resultDict;
}

- (NSDictionary *)allIvars
{
    unsigned int count = 0;
    
    //获取类的所有成员变量，如果没有成员变量则count = 0
    Ivar *ivars = class_copyIvarList([self class], &count);
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    
    for (int i = 0; i < count; i++) {
        //获取属性的名称和值
        const char *varName = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:varName];
        id ivarValue = [self valueForKey:name];
        
        if (ivarValue) {
            resultDict[name] = ivarValue;
        }
        else{
            resultDict[name] = @"字典的key对应的value不能为nil";
        }
    }
    
    //释放获取的属性数组指针
    free(ivars);
    
    return resultDict;
}

- (NSDictionary *)allMethods
{
    unsigned int count = 0;
    
    //获取类的所有方法，如果没有方法则count = 0
    Method *methods = class_copyMethodList([self class], &count);
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    
    for (int i = 0; i < count; i++) {
        //获取方法名称
        SEL methodSEL = method_getName(methods[i]);
        NSString *name = [NSString stringWithUTF8String:sel_getName(methodSEL)];
        
        //获取方法的参数列表
        int arguments = method_getNumberOfArguments(methods[i]);
        
        resultDict[name] = @(arguments - 2);
    }
    
    //释放获取的属性数组指针
    free(methods);
    
    return resultDict;
}

@end
