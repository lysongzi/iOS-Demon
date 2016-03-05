//
//  main.m
//  RuntimeDemon
//
//  Created by lysongzi on 16/3/5.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

//自定义一个C语言方法
void sayFunction(id self, SEL _cmd, id param)
{
    NSLog(@"永远%@岁的%@说：%@", object_getIvar(self, class_getInstanceVariable([self class], "_age")), [self valueForKey:@"name"], param);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //动态创建一个类,其继承自NSObject
        Class Person = objc_allocateClassPair([NSObject class], "Person", 0);
        
        //为该类添加NSString *_name成员变量
        class_addIvar(Person, "_name", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString*));
        //为该类添加int _age成员变量
        class_addIvar(Person, "_age", sizeof(int), sizeof(int), @encode(int));
        
        //注册方法名为say的方法
        SEL say = sel_registerName("say:");
        //为该类增加名为say的方法
        class_addMethod(Person, say, (IMP)sayFunction, "v@:@");
        
        //注册该类
        objc_registerClassPair(Person);
        
        //创建一个该类的实例
        id personInstance = [[Person alloc] init];
        
        //KVC动态改变对象实例中的属性
        [personInstance setValue:@"小松子" forKey:@"name"];
        
        //从类中获取成员变量
        Ivar ageIvar = class_getInstanceVariable(Person, "_age");
        //为成员变量赋值
        object_setIvar(personInstance, ageIvar, @16);
        
        //调用实例对象中的say方法选择器
        ((void (*)(id, SEL, id))objc_msgSend)(personInstance, say, @"我是可爱迷人的小松子~");
        
        //当Person类或者其子类实例还存在时，则不能销毁类
        personInstance = nil;
        
        //销毁类
        objc_disposeClassPair(Person);
    }
    return 0;
}
