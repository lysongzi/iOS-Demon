//
//  main.m
//  KVCAndKVODemon
//
//  Created by lysongzi on 16/2/28.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYSPerson.h"
#import "KVOTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        LYSPerson *person = [LYSPerson new];
        //通过属性自动生成的getter/setter来操作
        person.name = @"Lin";
        person.age = 16;
        //因为spouse属性是在扩展中定义的，对外不可见，这里访问不到该属性
        //person.spouse 不可访问
        
        NSLog(@"%@ is %d years old.", person.name, person.age);
        
        //通过KVC机制设置和获取对象的属性
        //需要注意的是，KVC机制设置属性的值必须是一个对象
        //所以简单类型的数据需要用NSNumber,NSValue等进行封装
        [person setValue:@"LinYouSong" forKey:@"name"];
        [person setValue:@18 forKey:@"age"];
        //虽然spouse属性是不可见的，但是KVC可以做到对私有属性的访问
        LYSPerson *wife = [LYSPerson new];
        wife.name = @"Beautiful Wife.";
        wife.age = 16;
        
        [person setValue:wife forKey:@"spouse"];
        [wife setValue:person forKey:@"spouse"];
        
        NSLog(@"After KVC.%@ is %@ years old.\n",
              [person valueForKey:@"name"],
              [person valueForKey:@"age"]);
        
        NSLog(@"And he's wife is a %@ years old girl, named %@.",
              [person valueForKeyPath:@"spouse.age"],
              [person valueForKeyPath:@"spouse.name"]);
        
        [[[KVOTest alloc] init] testKVO];
    }
    return 0;
}
