//
//  Stack.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

struct Stack<Element>:Container {
    //Element 类型占位符 泛型
    
    // IntStack 的原始实现部分
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    //Container 协议
    
   mutating func append(item: Element) {
        self.push(item: item)
    }
    
    var count: Int{
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
    
    typealias ItemType = Element
    
    
    
    
    
    
    
    
    
}














