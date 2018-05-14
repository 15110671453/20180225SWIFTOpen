//
//  ObjEnumStruct.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

enum WeekDays {
    case Monday,Tuesday,Wednesday,Thursday,Friday
}

enum Figure {
    
    case Rectangle(Int,Int)
    
    case Circle(Int)
}

class ObjEnumStruct: NSObject {

    var day = WeekDays.Friday
    
    func writeGreeting(day:WeekDays)  {
        switch day {
        case .Monday:
            print("星期一好")
        case .Tuesday:
            print("星期二好")
        case .Wednesday:
            print("星期三好")
        case .Thursday:
            print("星期四好")
        case .Friday:
            print("星期五好")
            fallthrough
        default:
            print("every day is beautiful")
        }
        
        
    }
    
    func printFigureEnum(figure:Figure) {
        
        /*枚举 使用 元组 的方式枚举  称为 相关值 枚举*/
        switch figure {
        case .Rectangle(let width, let height):
            print("矩形的宽：\(width) 高：\(height)")
        case .Circle(let radius):
            print("圆形的半径: \(radius)")
        default:
            print("一切安好")
        }
    }
    
    func printStruct()
    {
        print("Swift语言非常重视结构体 其与C++ 与 OC 中结构体有很大的差别 后面两者的结构体只可以定义一组相关的成员变量 而Swift中 结构体不仅可以定义成员变量 还可以定义成员方法 因此 我们可以将结构体看作轻量级的类")
        print("Swift中的类与结构体 非常类似 都具有定义和使用属性 方法 下标 和 构造函数 等面向对象的特性 但是结构体 不具有继承性 也不具备运行时强制类型转换 使用析构函数 和 使用引用计数等能力")
        
        
    }
    
    func updateDept( dept: inout Department){
        dept.name = "Research"
        
    }
    
    func updateEmp(emp:Employee){
        
        emp.job = "Clerk"
    }
    
}
