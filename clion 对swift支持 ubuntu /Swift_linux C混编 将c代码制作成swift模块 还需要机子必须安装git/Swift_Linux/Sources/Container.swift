//
//  Container.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

protocol Container {
    /*
     定义一个协议
     */
    /*
     该协议定义了一个关联类型 ItemType
     */
    associatedtype ItemType
    /*
     为什么需要关联类型
     Container 协议需要在不知道容器中元素的具体类型的情况下引用这种类型。Container 协议需要指定任何通过 append(_:) 方法添加到容器中的元素和容器中的元素是相同类型，并且通过容器下标返回的元素的类型也是这种类型。
     
     为了达到这个目的，Container 协议声明了一个关联类型 ItemType，写作 associatedtype ItemType。这个协议无法定义 ItemType 是什么类型的别名，这个信息将留给遵从协议的类型来提供。尽管如此，ItemType 别名提供了一种方式来引用 Container 中元素的类型，并将之用于 append(_:) 方法和下标，从而保证任何 Container 的行为都能够正如预期地被执行
     */
    
    mutating func append(item:ItemType)

    var count:Int {get}
    
    subscript(i:Int)->ItemType { get }
    
}













