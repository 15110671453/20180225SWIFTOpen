//
//  Test.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

class Test {
    
    func log(message:String)  {
        
        print("FUNCTION:\(#function)")
        
        print("COLUMN:\(#column)")
        
        print("COLUMN:\(#line)")
        
        print("Info:\(message)")
        
    }
    
    func testIFString()  {
        var name1 = "world"
        
        var name2 = "world"
        
        if name1 == name2 {
            
            print("比较 两个字符串内容是否相等")
            print("name1 == name2")
        }
        
        let a1 = [1,2]
        let a2 = [1,2]
        
        if a1 == a2 {
            print("a1 == a2")
        }
        print("这里 比较两个字符串内容是否相等 String是值类型的 不是引用类型 而 Array 数组类型内容的判断 也是相等 因为Array也是数值类型 在Swift中的 Swift的原生数据类型 除了类都是结构体的按照值类型传递  在Swift使用OC方式创建的还是引用类型")
        print("Swift中运算符 问号 用于声明可选型       ")
        print("感叹号 对可选型值进行拆包")
        print("is 判断某个实例是否为某种类型")
        print("as 强制类型转换")
        print("逗号运算符 用于集合分隔元素")
        print("冒号运算符 用于字典分隔键值对")
    }
    
    
}
