//
//  ObjCategory.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit


extension String {
    
    
    
    subscript(index:Int)->String {
        
        if index > self.characters.count {
            
            return ""
            
        }
        
        var c:String = ""
        
        var i = 0
        
        for character in self.characters {
            
            if (i == index)
            {
                
                c = String(character)
                
                break
                
            }
            i = i + 1
            
        }
        
        return c
        
    }
    
}

extension Double {
    
    static var interestRate:Double = 0.0668
    func interestBy1() -> Double {
        
        return self * Double.interestRate
    }
    
    mutating func interestBy2() {
        
        self = self * Double.interestRate
    }
    
    static func interestBy3(amount:Double)->Double {
        
        return interestRate * amount
        
    }
    
}


extension Int {
    
    var  errorMessage:String {
        
        var errorStr = ""
        
        switch self {
        case -7:
            
            errorStr = "没有数据"
        case -6:
            
            errorStr = "日期没有输入"
        case -5:
            
            errorStr = "内容没有输入"
            
        case -4:
            
            errorStr = "ID没有输入"
            
        case -3:
            
            errorStr = "数据访问失败"
        case -2:
            
            errorStr = "你的账号最多只能插入十条数据"
        case -1:
            
            errorStr = "用户不存在"
        default:
            errorStr = ""
        }
        
        
        return errorStr
        
    }
    
}

class ObjCategory: NSObject {
    
    func description()   {
        
        print("Swift中的扩展机制 为什么需要扩展 因为继承机制比较繁琐 还因为 有些类会设置不允许继承 因此需要扩展机制")
        
        print("扩展机制 只有Objective-C与Swift中的相似 其他语言均没有")
        
        print("Swift的扩展机制 不仅可以扩展类 还可以扩展结构体 枚举 但是继承 只能继承类")
        
        print("扩展值类型的结构体 可以新添加方法  添加构造函数 但是对于类 引用类型 扩展时只能添加新的便利构造函数 但是不能添加新的指定构造函数 或 析构函数")
        
        
    }
    
    func test() {
        
        let val = -7
        let message = (val).errorMessage
        
        
        print("Error Code: \(val) ,Error Message: \(message)")
        
        let interest1 = (10_000.0).interestBy1()
        
        print("利息1:  \(interest1)")
        
        var interest2 = 10_000.0
        
        interest2.interestBy2()
        
       
        
        print("利息2:  \(interest2)")
        
        let interest3 = Double.interestBy3(amount: 10_000.0)
        
        print("利息3:  \(interest3)")
        
        
        let s = "The quick brown fox jumps over the lazy dog"
        
        print(s[0])
        
        print("ABC"[2])
        
        
    }
    
    
    
    
}
