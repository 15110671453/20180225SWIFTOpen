//
//  main.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//

/*swift  设计模式*/

/*
 swift中是不能使用宏定义语法的，
 #define  VALUE_TYPE_INT
 */


import Foundation

struct Function_Data {
    var func1Ptr = 0
    var func2Ptr = 0
    static var count = 0
   // class var count2 = 0
    /*
     Class properties are only allowed within classes; use 'static' to declare a static property
     */
    //结构体
    mutating func createCountIncrease()
    {
        Function_Data.count += 1
        
        print("生成结构体实例个数:\(Function_Data.count)")
    }
}
enum Value_Type:Int32 {
    /*
     原始值 模式 定义的 枚举
     */
    
    case VALUE_TYPE_INTV = 1
    /*
     case 之间 不能使用 逗号
     
     逗号 只在 一个 case 语句 定义 多个枚举成员时 使用
     */
    case VALUE_TYPE_STRUCTV = 2
    
}

let ob:POBJ = POBJ()

POBJ.VersionS = "版本信息1.0"
POBJ.managerCreate(message: "创建一条消息发出")
ob.description(mes: "测试输出")


let cpOb = CopyArrayVSDictionary()

cpOb.testCopyDic()

cpOb.testCopyArray()

var inOBJStack = IntStack()

inOBJStack.append(item: 100)
inOBJStack.append(item: 101)
inOBJStack.append(item: 102)

for value in inOBJStack.items
{
    print("value:\(value)")
}
//还需要遵守 Sequeces 协议
for (index,value) in inOBJStack.items.enumerated()
{
   print("\(inOBJStack[index])")
}

var stackM:Stack<String> = Stack<String>()

stackM.append(item: "协议")

stackM.append(item: "结构体")

stackM.append(item: "类")

stackM.append(item: "关联类型")

for value in stackM.items
{
    print("泛型value:\(value)")
}
//还需要遵守 Sequeces 协议
for (index,value) in stackM.items.enumerated()
{
    print("泛型-:\(stackM[index])")
}


let size = 10

let intPtr = UnsafeMutablePointer<Int>.allocate(capacity: size)

for idx in 0..<10 {
    intPtr.advanced(by: idx).pointee = idx
}

intPtr.pointee = 100

let voidPtr = UnsafeRawPointer(intPtr)

let intPtrAgain = voidPtr.assumingMemoryBound(to: Int8.self)

//cFunc(intPtrAgain)



//generic_function(Value_Type.VALUE_TYPE_INTV,intPtrAgain );

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

//generic_function(Value_Type.VALUE_TYPE_STRUCTV, &data);

intPtr.deallocate(capacity: size)

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
