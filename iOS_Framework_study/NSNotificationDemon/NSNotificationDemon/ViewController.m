//
//  ViewController.m
//  NSNotificationDemon
//
//  Created by lysongzi on 16/2/3.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView:) name:@"LYSNotification" object:nil];
}

- (void)updateView:(NSNotification *)value
{
    NSString *str = [value object];
    self.textField.text = str;
}

- (IBAction)jumpToSecond:(id)sender
{
    [self presentViewController:[[SecondViewController alloc] init] animated:YES completion:nil];
}


@end
