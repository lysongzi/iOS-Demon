//
//  ViewController.m
//  MasonryDemon
//
//  Created by lysongzi on 16/2/13.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *view1;
@property (strong, nonatomic) UIView *view2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view1 = [[UIView alloc] init];
    self.view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.view1];
    
    self.view2 = [[UIView alloc] init];
    self.view2.backgroundColor = [UIColor redColor];
    [self.view1 addSubview:self.view2];
}

- (void)updateViewConstraints
{
    //更新view1的约束，设置其四边距离父视图的距离均为50
    
    UIEdgeInsets padding = UIEdgeInsetsMake(50, 50, 50, 50);
    
//    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).with.offset(padding.top);
//        make.left.equalTo(self.view.mas_left).with.offset(padding.left);
//        make.bottom.equalTo(self.view.mas_bottom).with.offset(-padding.bottom);
//        make.right.equalTo(self.view.mas_right).with.offset(-padding.right);
//    }];
    
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(padding);
    }];
    
    //更新view2的约束，设置其边距约束等于父视图
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //edge的设置
        //make.edges.equalTo(self.view1);
        //make.edges.equalTo(self.view1).insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        //size的设置
        //size只能确定视图的大小，并不能约束视图间的相对位置
        //需要结合edge或者center等约束视图的位置
        //make.size.equalTo(self.view1);
        make.size.equalTo(self.view1).sizeOffset(CGSizeMake(-100, -100));
        
        //center的设置
        //实验结果得出只设置center属性是不足够的
        //还要结合edge或者size属性才能确定视图的位置和大小
        make.center.equalTo(self.view1);
        //make.center.equalTo(self.view1).centerOffset(CGPointMake(-20, -20));
        
        //链式属性设置
        //make.left.bottom.and.right.equalTo(self.view1);
        //make.top.equalTo(@50);
    }];
    
    //在最后调用父类更新视图的方法
    [super updateViewConstraints];
}

@end
