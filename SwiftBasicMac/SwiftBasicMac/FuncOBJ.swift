//
//  FuncOBJ.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation


class FuncOBJ {
    
    
    func rectangleArea(width:Double,height:Double) -> Double {
        /*只有内部参数 外面调用时 不知道函数意义 默认 Swift都会提供内外部参数 内外部参数名一致*/
        
        let area = width * height
        
        
        return area
        
        
    }
    
    func rectangleArea2(W width:Double,H height:Double) -> Double {
        /*  修改 外部参数的名  内部和外部 使用的名字不一样*/
        
        let area = width * height
        
        
        return area
        
        
    }
   
    
    func rectangleArea3(W width:Double,_ height:Double) -> Double {
        /* 取消外部参数名 以方便使用*/
        
        let area = width * height
        
        
        return area
        
        
    }
    
    func rectangleArea4(width:Double,_ height:Double) -> Double {
        /* 取消外部参数名 以方便使用*/
        
        let area = width * height
        
        
        return area
        
        
    }
    
    
    func rectangleArea5(_ width:Double,_ height:Double) -> Double {
        /*  修改 外部参数的名  内部和外部 使用的名字不一样*/
        
        let area = width * height
        
        
        return area
        
        
    }
    
    
    
    func sum(numbers:Double...) -> Double {
        
        print("函数 可变参数")
        
        var total:Double = 0
        
        for num in numbers {
            total += num
        }
        
        return total
        
        
        
    }
    
    func increment( value:inout Double,amount:Double = 1.0)  {
        
        print("函数参数传递 有两种方式 值类型 与 引用类型")
        
         print("值类型 传递的是参数的副本  函数调用 过程中 并不会影响原始数据")
        
        
        
        value += amount
        
        
    }
    
    func position(dt:Double,speed:(x:Int,y:Int)) -> (x:Int,y:Int) {
        
        
        let posx:Int = speed.x * Int(dt)
        
        let posy:Int = speed.y * Int(dt)
        
        return (posx,posy)
        
    }
    
    func rectangleArea78(width:Double,height:Double) -> Double {
       
        let area = width * height
        
        return area
        
    }
    
    
    
}











