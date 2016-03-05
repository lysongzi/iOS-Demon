//
//  main.m
//  RumtimeDemonSecond
//
//  Created by lysongzi on 16/3/5.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYSPerson.h"

int main2(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*获取一个类的属性，成员变量和方法信息*/

        LYSPerson *lysongzi = [[LYSPerson alloc] init];
        lysongzi.name = @"小松子";
        lysongzi.age = 16;
        [lysongzi setValue:@"天才" forKey:@"occupation"];
        
        NSDictionary *propertyResultDict = [lysongzi allProperties];
        for (NSString *propertyName in propertyResultDict) {
            NSLog(@"propertyName = %@, propertyValue = %@", propertyName, propertyResultDict[propertyName]);
        }
        
        NSDictionary *ivarResultDict = [lysongzi allIvars];
        for (NSString *ivarName in ivarResultDict) {
            NSLog(@"iavrName = %@, ivarValue = %@", ivarName, ivarResultDict[ivarName]);
        }
        
        NSDictionary *methodResultDict = [lysongzi allMethods];
        for (NSString *methodName in methodResultDict) {
            NSLog(@"methodName = %@, argument = %@", methodName, methodResultDict[methodName]);
        }
        
    }
    return 0;
}
