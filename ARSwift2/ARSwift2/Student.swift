//
//  Student.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class Student: Person {

    var school:String
    
    override class  var staClassProp:Double {
    
        return 0.0701 * 1_000_000
    
    }

    init(name:String,age:Int,school:String) {
    print("Swift中的子类的构造函数 有两种来源 自己编写 和 从父类继承 并不是父类的所有构造函数都能继承下来 能够继承下来的构造函数是有条件的")
    print("条件一:如果子类没有定义任何指定构造函数 它将自动继承父类的所有指定构造函数")
    print("条件二 如果子类提供了所有父类指定构造函数的实现 无论是通过条件一继承过来的的 还是通过自己编写实现的 它都将自动继承父类的所有便利构造函数")
    print("构造过程 两个阶段 第一 首先分配内存 初始化子类存储属性 沿构造函数链向上初始化父类存储属性 到达构造函数链顶端 初始化全部的父类存储属性")
        self.school = school
        super .init(name: name, age: age)
    }
   convenience override init(name:String,age:Int) {
    print("便利构造函数 必须有调用同一类中的其他构造函数")
    print("这里实现了父类的指定构造函数 由于子类的构造函数与父类构造函数参数相同 需要用override 关键字 表示子类构造函数重写了父类构造函数")
    print("由于实现了父类指定构造函数 因此也继承了父类的另外两个便利构造函数")
    self.init(name: name, age: age, school:"清华大学-Student")
        
    }
    
    override func decription() -> String {
        
        return "\(name) 年龄是 \(age) 毕业于 \(school)  静态属性 \(Student.staticProp) 可重写 \(Student.staClassProp)"
    }
    
}
