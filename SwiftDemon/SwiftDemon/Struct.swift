//
//  Struct.swift
//  SwiftDemon
//
//  Created by lysongzi on 16/1/29.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

import Foundation

struct Card
{
    var rank: Rank
    var raw: Int
    
    func Decription() -> String
    {
        return "Rank is \(rank.Description()), raw is \(rank.rawValue)."
    }
}