//
//  File.swift
//  SwiftDemon
//
//  Created by lysongzi on 16/1/29.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

import Foundation

enum Rank: Int
{
    case Ace = 0
    case One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Bingo, Tom
        func Description() -> String
        {
            switch self
            {
                case Ace:return "Ace"
                case Jack:return "Jack"
                case Bingo:return "Bingo"
                case Tom:return "Tom"
                default: return String(self.rawValue)
            }
        }
}
