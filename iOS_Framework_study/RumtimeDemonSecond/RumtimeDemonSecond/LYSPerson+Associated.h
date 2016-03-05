//
//  LYSPerson+Associated.h
//  RumtimeDemonSecond
//
//  Created by lysongzi on 16/3/5.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "LYSPerson.h"

//定义一个回调块
typedef void (^CodingCallBack)();

@interface LYSPerson (Associated)

@property (nonatomic, strong) NSNumber *associatedBust;
@property (nonatomic, copy) CodingCallBack associatedCallBack;

@end
