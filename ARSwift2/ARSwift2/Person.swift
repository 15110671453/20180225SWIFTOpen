//
//  Person.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name:String
    
    var age:Int
    
    static var staticProp:Double {
        
        return 0.0668 * 1_000_000
        
    }
    
    class var staClassProp:Double {
        
        return 0.0700 * 1_000_000
        
    }
    
    func decription()->String {
        
        
        return "\(name) 年龄是 \(age) 静态属性 \(Person.staticProp) 可重写 \(Person.staClassProp)"
        
    }
    
    init(name:String,age:Int) {
        
        self.name = name
        self.age = age
        
        super.init()
    }
    
    convenience init(name:String){
        
        self.init(name: name, age: 18)
    }
    
    convenience override init() {
        
        print("Swift 中 类只能单继承 Objective-C中所有类的基类都是NSObject 但是Swift 没有规定这样一个类 此外 override init() 是子类重写父类构造函数 我们这里继承了NSObject 所以要override")
        
        print("从顶部函数链往下 可以对每个类进行进一步修改修改存储属性 调用实例方法等处理")
        
        self.init(name: "Tony-Person")
        self.age = 18
        
    }
    
     
    
    
    
}
