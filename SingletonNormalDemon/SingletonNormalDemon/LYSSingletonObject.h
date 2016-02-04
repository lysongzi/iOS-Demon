//
//  LYSSingletonObject.h
//  SingletonNormalDemon
//
//  Created by lysongzi on 16/2/3.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYSSingletonObject;

@interface LYSSingletonObject : NSObject

+ (LYSSingletonObject *)sharedInstance;

@end
