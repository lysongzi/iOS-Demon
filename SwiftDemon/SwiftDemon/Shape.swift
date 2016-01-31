//
//  myClass.swift
//  SwiftDemon
//
//  Created by lysongzi on 16/1/29.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

import Foundation

class Shape
{
    var height : Double = 0.0
    var width : Double = 0.0
    
    var area : Double{
        get
        {
            return height * width
        }
        
        set
        {
            self.area = height * width
        }
    }
    
    init(h: Double, w :Double)
    {
        self.height = h
        self.width = w
    }
    
    func Description() -> String
    {
        return "Height = \(self.height), Width = \(self.width)"
    }
}