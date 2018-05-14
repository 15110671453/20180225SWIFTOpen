//
//  ObjFunction.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class ObjFunction: NSObject {
    
    func rectangleArea(width:Double,height:Double) -> Double {
        let area = width * height
        
        return area
    }
    
    func triangleArea(bottom:Double,height:Double) -> Double {
        let area = 0.5 * bottom * height
        
        return area
    }
    
    func getAreaFunc(type:String) -> (Double,Double)->Double {
        print("将函数作为函数的返回值")
        
        var returnFunction:(Double,Double)->Double
        
        switch type {
        case "rect":
            returnFunction = rectangleArea
        
        case "tria":
            returnFunction = triangleArea
            
        default:
            returnFunction = rectangleArea
        }
        
        
        return returnFunction
    }
    
    func getAreaByFunc(funcName:(Double,Double)->Double,a:Double,b:Double) ->Double {
        
        let area = funcName(a,b)
        
        return area
    }
    
    func testArea() {
        
     let area = getAreaByFunc(funcName: getAreaFunc(type: "rect"), a: 12, b: 12)
        
        print("面积 计算: \(area)")
    }
    
    func pasValueToPasRef( value:inout Double,amount: Double = 1.0)  {
        print("参数传递的方式有两种 值类型 与 引用类型 值类型给函数传递的是参数的一个副本 这样函数的调用过程中 不会影响原始数据 引用类型是把数据本身引用（内存地址）传递过去 这样在函数的调用过程中会影响原始数据 在众多数据类型中 只有类是引用类型 其他数据类型 如 整型 浮点型 布尔型 字符 字符串 元组 集合 枚举和 结构体 全部 是值类型 但是凡事都有列外 有时候就是要将一个值类型 参数 以引用方式传递 这也是可以实现的 Swift提供inout 关键字就可以实现")
        value += amount
    }
    
    func calculate(opr:String)->(Int,Int)->Int {
        
        print("嵌套函数")
        print("嵌套函数 默认情况下 函数作用域 在外函数体內 但我们可以定义外函数的返回值为嵌套函数类型 从而将嵌套函数传递给外函数 从而被其他调用者调用")
        
        //定义+函数
        func add(a:Int,b:Int) -> Int {
            
            return a + b
            
        }
        //定义-函数
        
        func sub(a:Int,b:Int)->Int {
            
            return a - b
        }
        
        var result:(Int,Int)->Int
        
        switch opr {
        case "+":
            result = add
            
        case "-":
            result = sub
        default:
            result = add
        }
        
        
        return result
        
        
    }
    
    func doBlock() {
        
        print("闭包 是自包含的匿名函数代码块 可以作为表达式 函数参数 和 函数返回值 闭包表达式 的运算结果 是一种函数类型")
        /*
         {
         (参数列表) -> 返回值类型 in
         
         语句组
         
         
         }
         */
        
        let f1 = makeArray()
        
        print("--f1--")
        print(f1("张三"))
        print(f1("李四"))
        print(f1("王五"))
        
        let f2 = makeArray()
        
        print("--f2--")
        print(f2("刘备"))
        print(f2("张飞"))
        print(f2("关羽"))
        
        
        
    }
    
    func makeArray() -> (String)->[String] {
        
        var ary:[String] = [String]()
        
        func addElement(element:String) ->[String] {
            
            ary.append(element)
            
            return ary
        }
        
        
        return addElement
        
    }

}
