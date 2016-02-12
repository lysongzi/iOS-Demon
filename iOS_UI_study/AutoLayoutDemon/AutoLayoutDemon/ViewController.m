//
//  ViewController.m
//  AutoLayoutDemon
//
//  Created by lysongzi on 16/2/12.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self setSuperView];
    [self addSubview];
}

- (void)setSuperView
{
    self.view.backgroundColor = [UIColor grayColor];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)addSubview
{
    self.view1 = [[UIView alloc] init];
    self.view1.translatesAutoresizingMaskIntoConstraints = NO;
    self.view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.view1];
    
    self.view2 = [[UIView alloc] init];
    self.view2.translatesAutoresizingMaskIntoConstraints = NO;
    self.view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.view2];
    
    self.view3 = [[UIView alloc] init];
    self.view3.translatesAutoresizingMaskIntoConstraints = NO;
    self.view3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.view3];
}

-(void)updateViewConstraints
{
    [super updateViewConstraints];
    
    //添加view1的大小约束
    [self.view1 addConstraint:
        [NSLayoutConstraint constraintWithItem:self.view1
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:0.0f
                                      constant:200]];
    
    [self.view1 addConstraint:
        [NSLayoutConstraint constraintWithItem:self.view1
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:0.0f
                                      constant:200]];
    
    //约束view2
    [self.view2 addConstraint:
        [NSLayoutConstraint constraintWithItem:self.view2
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:0.0f
                                      constant:100]];
    
    [self.view2 addConstraint:
        [NSLayoutConstraint constraintWithItem:self.view2
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:0.0f
                                      constant:100]];
    
    [self.view addConstraint:
        [NSLayoutConstraint constraintWithItem:self.view2
                                     attribute:NSLayoutAttributeTopMargin
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view1
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0f
                                      constant:20]];
    
    //约束view3
    [self.view3 addConstraint:
     [NSLayoutConstraint constraintWithItem:self.view3
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:0.0f
                                   constant:100]];
    
    [self.view3 addConstraint:
     [NSLayoutConstraint constraintWithItem:self.view3
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:0.0f
                                   constant:100]];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.view3
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view1
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.0f
                                   constant:0]];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.view3
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view1
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0f
                                   constant:0]];
}

@end
