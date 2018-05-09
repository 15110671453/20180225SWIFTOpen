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



/*
 设计模式
 https://legacy.gitbook.com/book/yourtion/swiftdesignpatterns/details
 
 如何在Swift中调用C
 比如 Redis 数据库的使用
 
 http://hearrain.com/2015/12/850
 
 首先 明确c中const 使用规则
 
 只有被const直接修饰的变量最终指向的内容不可变（忽略变量类型修饰符，即int， long等）。
 
 在const int *p中，忽略掉int，被const直接修饰的是*p，*p最终指向指针p指向的地址的内容，所以该内容不可变（至少不可以使用*p进行修改），而变量p没有被const直接修饰，所以指正变量p最终指向的内容（也就是p本身的值）是可变的。这样这一句可以等效于int const *p。（这两种声明有没有其他的不同之处，笔者暂时还不清楚）
 
 在int * const p中，指针变量p本const直接修饰，所以p的内容（地址）是不可变的，而p指向的地址的内容（即*p）没有被const直接修饰，所以p指向的地址的内容是可变的，即*p可以被再赋值
 
 Swift 中 UnsafePointer<Type>  等同于 C指针
 const Type* p
 
 UnsafeMutablePointer<Type> 等同于 C指针 Type* p
 
 */




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

let intPtr = UnsafeMutablePointer<Int32>.allocate(capacity: size)

for idx in 0..<10 {
    intPtr.advanced(by: idx).pointee = Int32(idx)
}

intPtr.pointee = 100

cFuncInt(intPtr)

var strPtr = ["C指针","OC指针","Swift","JS-ES6","Python"]

/*
 Swift  中 虽然 沿用 有 c 的& 取地址符
 但是 功能有所不同  要真的取得指针 和C API 交互
 需要
 */

/*
 如果我们想对某个变量进行指针操作，我们可以借助withUnsafePointer这个辅助方法。这个方法接受两个参数，第一个是 inout的任意类型，第二个是一个闭包。Swift会将第一个输入转换为指针，然后将这个转换后的Unsafe的指针作为参数，去调用闭包
 */

print("Swift 字符串 到 c 字符串指针")

var test = "C指针".withCString { (p:UnsafePointer<Int8>) -> Int8 in
    cFuncStr(p)
    
    var pS =    UnsafeMutablePointer<Int8>.allocate(capacity: 8);
        var idx = 0
    
    var lin = pS + idx

    repeat {
        pS.advanced(by: idx).pointee = p.advanced(by: idx).pointee
        lin = pS + idx
        print("-\(lin.pointee)")
        
      idx = idx + 1
    }while(lin)
    
    return p.pointee
}

print("输出的是第一个字节的值 \(test)")





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
