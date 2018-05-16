//
//  OptionalOBJ.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation


class OptionalOBJ {
    
    var n1:Int = 10
    
    var n2:Int
    
    let str:String = "let variable"
    
   
    
    
    
    
    init(val1:Int,val2:String,message:String) {
        
        
        print("Swift 中 所有数据类型的声明 变量或常量 都是不能为空nil的")
        
        print("在类的声明中  变量与常量的声明中 如果不是可选型 还不定义值 就一定要 定义 类的实例化方法中 给这些变量赋值")
        
        self.n2 = val1
        
        print("\(n2) \(val2) \(message)")
    }
    
    func divide(n1:Int,n2:Int) -> Double? {
        
        
        if n2 == 0 {
            
            return nil
            
        }
        
        return Double(n1) / Double(n2)
        
    }
    
    func testDivide()  {
        
        print("可选绑定")
        
        if let res = divide(n1: 100, n2: 0)  {
            
            print("success")
            
        }else
        {
            print("failure")
            
        }
    }
    
    
    
    
}












