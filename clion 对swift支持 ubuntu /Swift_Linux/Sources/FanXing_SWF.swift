//
//  FanXing_SWF.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/14.
//  Copyright © 2018年 admindyn. All rights reserved.
//
//MARK:Process
#if os(Linux)
    import SwiftGlibc
let WUNTRACED = Int32(2)
let WNOHANG = Int32(1)
let SIGTERM = Int32(15)
#else
    import Darwin
#endif
import Foundation


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

class FanXing_SWF {
    
    func test()  {
        
        //MARK: 泛型 关联类型 单例设计模式
        
        
        
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
        
        
    }
}
