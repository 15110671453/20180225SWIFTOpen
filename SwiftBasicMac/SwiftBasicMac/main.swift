//
//  main.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

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
