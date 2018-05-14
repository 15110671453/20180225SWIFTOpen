//
//  ObjSet.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class ObjSet: NSObject {

    let numbers:Array = [1,2,3,4,5,6,7,8,9]
    
    let dics:Dictionary = ["name":"dyn","age":"27"]
    /*
     由于 Set 与 Array的字面量表示一样 如果 不指明数据类型 默认情况下 [...]形式表示数组
     
     所以 以下的arr 变量 是 数组 并不是Set集合
     
     */
    let arr = ["张三","李四","数组"]
    
    let sets:Set<String> = ["张三","李四","王五"]
    
    func doHandleSet(listSet:Set<String>)  {
        
       print("集合Set 与数组比较 数组中元素是有序的 并且不管其中数据是否有重复 而set是无序的 但是不能有重复的元素")
        
        print("Set也是结构体类型 但是在OC中 却是NSSet 类 也是凭借apple的 零开销桥接技术实现的")
        
        for (index,value) in listSet.enumerated() {
            print("Item \(index + 1) : \(value)")
        }
        
        
        
    }
    
    func doArray(listArr:Array<String>)  {
        print("数组只关心元素是否有序 不关心元素是否重复 一个数组列表中 可能存在两个\"张三\"")
        print("可变数组 就用 var 声明变量 不可变数组 就用let  这里的swift Array 是结构体类型")
        
        
        for (index,value) in listArr.enumerated() {
            print("Item \(index + 1) : \(value)")
        }
        print("OC 中 array dictionar 都不是结构体类型 但是swift 中 都是结构体类型  但是Apple 在他们之间做了 零开销桥接技术")
        
        
        for item in listArr {
            
            print(item)
            
        }
        
        
        for ci in 0..<10 {
            
            print("开区间第\(ci + 1)个元素")
            
            
        }
        
        for cin in 0...5 {
            
            print("闭区间 第\(cin + 1)个元素")
            
            
        }
    }
    
    func doDictinary(listDic:Dictionary<Int,String>)  {
        print("Dictionary 是字典 在swift中是结构体类型 但是在OC中是类 是引用类型 也有可变 与 不可变之分")
        print("var 声明的字典是可变字典 如果初始化之后 不再修改字典 就应该将字典声明为let的 即 不可变字典")
        
        for (key,value) in listDic {
            print("学号: \(key) 学生: \(value)")
        }
    }
    
}
