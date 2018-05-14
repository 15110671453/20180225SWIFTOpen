//
//  ObjString.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

//MARK:使用Swift别名

typealias Location = CGPoint
typealias Distance = Double

class ObjString: NSObject {
    
    func distanceBetweenPoint(point: Location, toPoint: Location) -> Double {
        let dx = Double(toPoint.x - point.x)
        let dy = Double(toPoint.y - point.y)
        return sqrt(dx*dx + dy*dy)
    }
   
    func testBieMing()
    {
        
        let origin: Location = CGPoint(x: 0,y: 0)
        let point: Location = CGPoint(x:1 , y: 1)
        let distance: Distance = distanceBetweenPoint(point: origin, toPoint: point)
        print(distance)//1.4142135623731
        
        
    }
    
    func handleString(message:String)  {
        
        print("字符串 分为 可变字符串 与 不可变字符串 二者的区别 是 不可变字符不能进行拼接 追加 等修改")
        //不可变字符串 常量
        let str = message
        
        
        let flower:Character = "o"
        
        //可变字符串  非常量  可以拼接 追加
        var mutableStr:String = "开始 "
        
        mutableStr.append(flower)
        
        let start = mutableStr.startIndex
        
        let end = mutableStr.endIndex
        
        print(start)
        print(end)
        //let end2  = start.advancedBy()
        //let pre = end.predecessor()
        
        
        print(mutableStr)
        
        /*
         一个汉字 两个字节 两个汉字四个字节 按照字节数返回字符串个数
         显然不是 还是按照字符个数 一个unicode 字符串算一个字符
         */
        let mutableStr2:String = "开始"
        
        print(mutableStr2.count)
        
       let mutableStr3:String = "\u{12}"
        
        print(mutableStr3.count)
        
        let mutableStr4:String = "\u{1234}"
        
        print(mutableStr4.count)
        
        let  docFolder = ["java.docx","javabean.docx","objective-c.xlsx","swift.docx"]

        var wordCount = 0
        
        for doc in docFolder {
            if doc.hasSuffix(".docx") {
                
                 wordCount = wordCount + 1
            }
        }
        
        
        print(wordCount)
        
        /*
         STL（Standard Template Library，标准模板库)是惠普实验室开发的一系列软件的统称。它是由Alexander Stepanov、Meng Lee和David R Musser在惠普实验室工作时所开发出来
         algorithm（算法）、container（容器）和iterator（迭代器），
         
         algorithm（算法）
         
         <algorithm>是所有STL头文件中最大的一个（尽管它很好理解），它是由一大堆模版函数组成的，可以认为每个函数在很大程度上都是独立的，其中常用到的功能范围涉及到比较、交换、查找、遍历操作、复制、修改、移除、反转、排序、合并等等。
         
         
         
         <numeric>体积很小，只包括几个在序列上面进行简单数学运算的模板函数，包括加法和乘法在序列上的一些操作。
         
         
         
         <functional>中则定义了一些模板类，用以声明函数对象。
         
         iterator（迭代器）
         
         向量(vector) 连续存储的元素<vector>
         
         列表(list)       由节点组成的双向链表，每个结点包含着一个元素<list>
         
         双队列(deque) 连续存储的指向不同元素的指针所组成的数组<deque>
         
         集合(set) 由节点组成的红黑树，每个节点都包含着一个元素，节点之间以某种作用于元素对的谓词排列，没有两个不同的元素能够拥有相同的次序 <set>
         
         多重集合(multiset) 允许存在两个次序相等的元素的集合 <set>
         
         栈(stack) 后进先出的值的排列 <stack>
         
         队列(queue) 先进先出的执的排列 <queue>
         
         优先队列(priority_queue) 元素的次序是由作用于所存储的值对上的某种谓词决定的的一种队列 <queue>
         
         映射(map) 由{键，值}对组成的集合，以某种作用于键对上的谓词排列 <map>
         
         多重映射(multimap) 允许键对有相等的次序的映射 <map>
         通过迭代器能在尽可能少地知道某种数据结构的情况下完成对这一结构的运算，
         内存分配器
         */
        
    }
    
}
