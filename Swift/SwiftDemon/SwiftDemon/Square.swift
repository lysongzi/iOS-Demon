//
//  Square.swift
//  SwiftDemon
//
//  Created by lysongzi on 16/1/29.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

import Foundation

class Square : Shape
{
    //重写的方法前要加override,否则会发生编译时错误
    override func Description() -> String
    {
        return "area = \(self.area)"
    }
}