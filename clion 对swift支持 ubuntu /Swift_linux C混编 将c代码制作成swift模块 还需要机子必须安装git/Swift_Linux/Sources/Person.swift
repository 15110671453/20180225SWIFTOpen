//
//  Person.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

class Person {
    
    var name:String
    
    var age:Int
    
    init(name:String,age:Int) {
        
        self.age = age
        
        self.name = name
        
    }
    
    func testTuple()  {
        
        let student1 = ("1001","张三",30,175)
        
        let (userid,name,age,h) = student1
        
        print("用户id:\(userid) 名字:\(name) 年龄:\(age) 身高:\(h)")
         print("用户id:\(student1.0) 名字:\(student1.1) 年龄:\(student1.2) 身高:\(student1.3)")
        print(self.name)
    }
    
    
    
}

