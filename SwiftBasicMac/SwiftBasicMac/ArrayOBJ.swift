//
//  ArrayOBJ.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

class ArrayOBJ {
    
    func testArray()  {
        
        
        var  student:[String] = ["张三","李四","王五"]
        
        student.append("东流")
        
        print(student)
        print("应该加双引号的输出:\(student)")
        
        student.insert("张飞", at: student.count-3)
        
        
        print(student)
        
        student[0] = "诸葛亮"
        
        print(student)
        
        print("数组遍历:")
        
        for item in student {
            
            print(item)
            
            
        }
        
        print("数组遍历enumerated:")
        for (index,val) in student.enumerated() {
            
            print("\(index):\(val)")
            
            
        }
        
    }
    
    
    
    
    
}













