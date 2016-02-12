//
//  SecondViewController.m
//  NSNotificationDemon
//
//  Created by lysongzi on 16/2/3.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 30)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithWhite:0.800 alpha:1.000]];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)back:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LYSNotification" object:@"Hello World"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
