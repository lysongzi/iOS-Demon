//
//  ViewController.swift
//  SwiftDemon
//
//  Created by lysongzi on 16/1/28.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //定义函数
    func greeting(name: String, word: String) -> String
    {
        return "Hello, \(name). \(word)"
    }
    
    //通过元组返回多个值
    func getNumbers() -> (Double, Double, Double)
    {
        return (1.0, 2.0 , 3.0);
    }
    
    //可变长参数列表
    func sumOf(numbers: Int...) -> Int
    {
        var sum : Int = 0;
        for number in numbers
        {
            sum += number;
        }
        return sum;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Hello, World.")
        
        //var声明变量，let声明常量
        var myVariable = 10
        let myConstant = 20
        
        //指定类型
        let myVariableDouble : Double = 10
        
        //字符格式化
        let Summary1 = "maVariable = \(myVariable++)"
        let Summary2 = "sum = \(myVariable + myConstant)"
        
        print(myVariableDouble)
        print(Summary1)
        print(Summary2)
        
        //数组和字典
        var myList = ["One", "two", "three"]
        var myDict = [
            "one":"11",
            "two":"2",
            "three":"3"
        ]
        
        print(myList)
        print(myDict)
        
        myList[0] = "one"
        print(myDict[myList[0]])
        
        myDict[myList[0]] = "1"
        print(myDict[myList[0]])
        
        //创建空数组和空字典
        //var emptyList = String[]()
        //var emptyDict = Dictionary<String, Float>()
        
        for number in myList{
            print("number = " + String(number));
        }
        
        //可空类型，需要在显示类型声明后面加一个？
        let stringMaybeEmpty : String? = "not Empty";
        //stringMaybeEmpty = nil;
        
        if let str = stringMaybeEmpty
        {
            print("str = " + str);
        }
        
        //调用函数
        print(greeting("Bingo", word: "I love you."))
        print(getNumbers())
        print(sumOf())
        print(sumOf(1, 2, 3))
        
        //类，继承和重写
        let shape = Shape(h: 10, w: 10);
        print(shape.Description())
        
        let square = Square(h: 20, w: 30);
        print(square.Description())
        
        //枚举
        let testEnum = Rank.One
        print(testEnum.rawValue)
        print(testEnum.Description())
        
        //结构体
        let structTest = Card(rank: Rank.Ace, raw: Rank.Ace.rawValue)
        print(structTest.Decription())
    }

}

