//
//  ViewController.m
//  AppToOpenURLScheme
//
//  Created by lysongzi on 16/3/13.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openUrlScheme:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"urlSchemeOne://?token=123456&id=10086"];
    
    //先判断一下是否可以启动该url
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    else{
        NSLog(@"No such url.");
    }
}

@end
