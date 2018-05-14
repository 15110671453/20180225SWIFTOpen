//
//  ObjSwift.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class ObjSwift: NSObject {
    
    var name:String
    
    var testOptional:String? = nil
    
    var testOptionalInt:Int? = 100
    
    /*非可选型类型 不可以赋值为nil*/
    var  test:String = "not nil"
    
    var age:Int
    
    /*什么时候 init 需要用 override*/
     init(name:String,age:Int) {
        self.name = name
        self.age = age
        print("什么时候 init 需要用 override")
    }
    
    func logMes(message:String) -> uint {
        
        let suc:uint = 0
        
        print("FUNCTION:\(#function) COLUMN:\(#column)FILE:\(#file)LINE:\(#line)\(message)")
        return suc
        
    }
    
    func divide(n1:Int,n2:Int) -> Double? {
        
        if n2 == 0 {
            return nil
        }
        
        return Double(n1)/Double(n2)
    }
    
    
}
