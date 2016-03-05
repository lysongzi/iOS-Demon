//
//  main.m
//  RumtimeDemonSecond
//
//  Created by lysongzi on 16/3/5.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYSPerson.h"
#import "LYSPerson+Associated.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        LYSPerson *lysongzi = [[LYSPerson alloc] init];
        lysongzi.name = @"小松子";
        lysongzi.age = 16;
        [lysongzi setValue:@"天才" forKey:@"occupation"];
        
        lysongzi.associatedBust = @(90);
        lysongzi.associatedCallBack = ^(){
            NSLog(@"可爱迷人的小松子正在写代码...");
        };
        
        //调用回调块
        lysongzi.associatedCallBack();
        
        NSDictionary *propertyResultDict = [lysongzi allProperties];
        for (NSString *propertyName in propertyResultDict) {
            NSLog(@"propertyName = %@, propertyValue = %@", propertyName, propertyResultDict[propertyName]);
        }
        
        NSDictionary *methodResultDict = [lysongzi allMethods];
        for (NSString *methodName in methodResultDict) {
            NSLog(@"methodName = %@, argument = %@", methodName, methodResultDict[methodName]);
        }
    }
    return 0;
}
