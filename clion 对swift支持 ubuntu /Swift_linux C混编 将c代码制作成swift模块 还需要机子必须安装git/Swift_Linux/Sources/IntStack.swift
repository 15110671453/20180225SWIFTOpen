//
//  IntStack.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

struct IntStack:Container {
    
    // IntStack 的原始实现部分
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    //Container 协议的实现部分
    /*
     这里xcode 自动补全协议代码 端 没有把关键字
     mutating 带过来 自己加上 免得报错 才意识到
     */
    mutating func append(item: Int) {
        self.push(item: item)
        print("插入:\(item)")
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
    
    var count: Int
    {
        get {
           return items.count
        }
    }
    
    /*
     事实上，如果你在上面的代码中删除了 typealias ItemType = Int 这一行，一切仍旧可以正常工作，因为 Swift 清楚地知道 ItemType 应该是哪种类型。
     
     写这个 只是为了体现 associatedtype
     关键字 关联类型的意义
     
     */
    typealias ItemType = Int
    
    //
}













