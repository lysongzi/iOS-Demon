//
//  KVOTest.m
//  KVCAndKVODemon
//
//  Created by lysongzi on 16/2/28.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "KVOTest.h"
#import "LYSPerson.h"

static char * const CONTEXT_KVO_LYSPERSON_AGE_CHANGE = "KVO_LYSPERSON_AGE";

@interface KVOTest ()

@property (nonatomic, copy) NSMutableArray *observedPerson;

@end

@implementation KVOTest

-(instancetype)init
{
    self = [super init];
    if (self) {
        _observedPerson = [NSMutableArray new];
    }
    return self;
}

-(void)testKVO
{
    LYSPerson *person;
    
    for (int i = 12; i <= 20; i++) {
        person = [[LYSPerson alloc] init];
        person.age = i;
        person.name = [NSString stringWithFormat:@"KVOPerson%d", i];
        
        //设置观察age属性,并指定观察新值和旧值
        [person addObserver:self
                 forKeyPath:@"age"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                    context:CONTEXT_KVO_LYSPERSON_AGE_CHANGE];
        //保留被观察的对象
        [self.observedPerson addObject:person];
    }
    
    //然后我们修改LYSPerson对象的age属性值
    for (LYSPerson *person in self.observedPerson) {
        person.age += 1;
    }
}

/**
 *  重写该方法，处理指定观察值发生变化时的事件
 *
 *  @param keyPath 观察的key
 *  @param object  属性发生变化的对象
 *  @param change  发生的变化，新值旧值等信息都保存在字典中，根据键值取出需要的信息
 *  @param context context 描述符
 */
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSString *,id> *)change
                      context:(void *)context
{
    if (context == CONTEXT_KVO_LYSPERSON_AGE_CHANGE) {
        NSString *name = [object valueForKey:@"name"];
        //NSNumber *newAge = [object valueForKey:@"age"];
        NSNumber *newAge = [change objectForKey:NSKeyValueChangeNewKey];
        NSNumber *oldAge = [change objectForKey:NSKeyValueChangeOldKey];
        NSLog(@"Person named %@ has change his age from %@ to %@.", name, oldAge, newAge);
    }
}

-(void)dealloc
{
    //移除所有观察事件
    for (LYSPerson *person in self.observedPerson) {
        [person removeObserver:self forKeyPath:@"age"];
    }
    //移除所有对象
    [self.observedPerson removeAllObjects];
}

@end
