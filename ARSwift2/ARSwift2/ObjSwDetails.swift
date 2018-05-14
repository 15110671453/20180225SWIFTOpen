//
//  ObjSwDetails.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/4.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class ObjSwDetails: NSObject {
    /*
     帮助我们建立对Swift源码整体了解 不要被源码吓倒
     我们在看Swift 基础框架源码
     
     经常看到的一些基础 问题
     
     访问级别 public 可以访问自己模块中的任何public实体 如果用import语句引入其他模块 我们可以访问其他模块中的public实体
     internal 只能访问自己模块的任何internal实体 不能访问其他模块中的internal实体 internal 省略 换句话说默认限定是 internal
     private 只能在当前源文件中使用的实体 称为 私有实体 使用private修饰 可以用作隐藏某些功能的实现细节
     
     看String结构体 Swift源码
     
     还遇到  我们在C++中的迭代器Iterator 以及模版类概念（泛型） 以及
     特有的Swift 闭包 参数名省略机制
     
     Swift可以用$0 $1 $2 ...来指定闭包中的参数：$0是指代第一个参数 $1指代第二个参数 依次类推$n+1 指代第n个参数
     
     Swift字符串 下标运算符 与 区间运算符与Range
     
     我们会看到 Swift 中扩展的特别之处
     
     我们之前使用Swift 扩展 类 结构体 甚至扩展时 扩展中遵从协议
     
     而当我们看Swift String源码时 发现 甚至
     
     Swift做到 扩展协议 并且使用Extension 与 Where结合 实现 扩展约束
     有时候, 我们想拓展一个协议, 但是需要加以一定的限制, 例如还需要满足另外一个协议的情况下才允许使用此拓展, 就需要用到约束了. 约束通过where来添加, 这个在Generic泛型使用中很常见
     
     
     在阅读String源码时 我们发现 Swift对String结构体中 类型嵌套 在String结构体 中 声明了 许多其他结构体 比如各种UTF8View  SubString
     
     Swift 模版库 与 C++ 模版库 怎么看怎么像
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
