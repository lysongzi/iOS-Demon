//
//  ViewController.m
//  SingletonNormalDemon
//
//  Created by lysongzi on 16/2/3.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"
#import "LYSSingletonObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LYSSingletonObject *object1 = [LYSSingletonObject sharedInstance];
    LYSSingletonObject *object2 = [LYSSingletonObject sharedInstance];
    
    if (object1 == object2)
    {
        NSLog(@"object1 == object2");
        NSLog(@"%@", object1);
        NSLog(@"%@", object2);
    }
}

@end
