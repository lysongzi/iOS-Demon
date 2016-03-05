//
//  LYSPerson.h
//  RumtimeDemonSecond
//
//  Created by lysongzi on 16/3/5.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYSPerson : NSObject

{
    NSString * _occupation;
    NSString * _nationality;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic) int age;

- (NSDictionary *)allProperties;
- (NSDictionary *)allIvars;
- (NSDictionary *)allMethods;

@end
