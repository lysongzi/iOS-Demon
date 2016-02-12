//
//  ViewController.m
//  SingletonAdvancedDemon
//
//  Created by lysongzi on 16/2/3.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Singleton.h"
#import "LYSPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LYSPerson *person1 = [LYSPerson sharedInstance];
    LYSPerson *person2 = [LYSPerson sharedInstance];
    
    if (person1 == person2)
    {
        NSLog(@"person1 == person2");
        NSLog(@"%@", person1);
        NSLog(@"%@", person2);
    }
    
    for (int i = 0; i < 10; i++) {
        LYSPerson *person = [LYSPerson sharedInstance];
        NSLog(@"person %d: %@", i, person);
    }
}

@end
