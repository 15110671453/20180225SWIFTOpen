//
//  Basic_SWF.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/14.
//  Copyright © 2018年 admindyn. All rights reserved.
//


import Foundation
/*
 swift开源 到底对linux 跨平台开发支持多少
 
 
 
 Swift 开源出来的跨平台 可以在linux mac 下兼容 开源出来的库
 包括了GCD libdispathch json解析 xml解析 队列 线程 网络请求
 
 The Swift Core Libraries project provides higher-level functionality than the Swift standard library. These libraries provide powerful tools that developers can depend upon across all the platforms that Swift supports. The Core Libraries have a goal of providing stable and useful features in the following key areas:
 
 Commonly needed types, including data, URLs, character sets, and specialized collections
 Unit testing
 Networking primitives
 Scheduling and execution of work, including threads, queues, and notifications
 Persistence, including property lists, archives, JSON parsing, and XML parsing
 Support for dates, times, and calendrical calculations
 Abstraction of OS-specific behavior
 Interaction with the file system
 Internationalization, including date and number formatting and language-specific resources
 User preferences
 
 */
class BasicSWF {
    func test()  {
        
        
        /*
         结构体类型的成员逐一构造器(Memberwise Initializers for structure Types)
         与结构体不同，类实例没有默认的成员逐一构造器
         */
        var data = Function_Data(func1Ptr: 100, func2Ptr: 200)
        /*
         Cannot use mutating member on immutable value: 'data' is a 'let' constant
         */
        data.createCountIncrease()
        
        var data2 = Function_Data(func1Ptr: 100, func2Ptr: 200)
        
        data2.createCountIncrease()
        
        
        
        let str:String = "测试c字符串"
        
        
        
        
        
        let testT:Test = Test()
        
        testT.log(message: "输出test日志")
        
        testT.testIFString()
        
        let p1 = Person(name: "Tony", age: 19)
        
        print("Tony age:\(p1.age)")
        
        var a = 10
        
        a += 1
        
        print("++a : \(a)")
        
        
        
        p1.testTuple()
        
        
        
        let op:OptionalOBJ = OptionalOBJ(val1: 100, val2: "测试可选型", message: "发送可选型消息")
        
        op.testDivide()
        
        let result = op.divide(n1: 100, n2: 20)
        
        
        let g:Guard = Guard()
        
        g.testGuard()
        
        
        
        for val in 0...5 {
            
            if val == 3 {
                
                break
                
            }
            print("Count is: \(val)")
            
        }
        
        
        let l :Loop = Loop()
        
        l.testLoop()
        
        let ar:ArrayOBJ = ArrayOBJ()
        
        ar.testArray()
        
        let dic:DicOBJ = DicOBJ()
        
        dic.testDic()
        
        let setB:SetOBJ = SetOBJ()
        
        setB.testSet()
        
        setB.updateBSet()
        
        setB.operateSet()
        
        
        let fB:FuncOBJ = FuncOBJ()
        
        
        let area = fB.rectangleArea(width: 320, height: 480)
        
        let barea = fB.rectangleArea2(W: 320, H: 480)
        
        print("长方形面积:\(area)")
        
        print("长方形面积2:\(barea)")
        
        print("长方形面积3:\(fB.rectangleArea3(W: 320,  480))")
        
        
        
        print("长方形面积4:\(fB.rectangleArea4(width: 320, 480))")
        
        
        
        print("长方形面积5:\(fB.rectangleArea5(320, 480))")
        
        
    }
}


