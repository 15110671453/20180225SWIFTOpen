//
//  SetOBJ.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation


class SetOBJ {
    
    
    func operateSet() {
        
        let A:Set<String> = ["a","b","c","d"]
        
        let B:Set<String> = ["d","e","c","f"]
        
        print("A 与 B 交集:\(A.intersection(B))")
        
        print("A 与 B 并集:\(A.union(B))")
        
        
         print("属于A或 属于B 但不同时属于A和B的元素的集合 称为A和B的异或 ")
        print("A 与 B 异或集合:\(A.symmetricDifference(B))")
        
        
        let C = A.subtracting(B)
        
        
        print("A 与 B 差集:\(C)")
        
        
        if C.isSubset(of: A) {
            
            
            print("C 是 A 的 子集")
            
            
            
        }
        
        
        
    }
    
    func testSet()  {
        
        let set1:Set<String> = ["张三","李四","王五","董六"]
        
        var set2 = Set<String>()
        
        
        let set3 =  ["张三","李四","王五","董六"]
        
        let set4:[String] = ["张三","李四","王五","董六"]
        
        let set6:[String] = ["董六","张三","李四","王五"]
        
        
        let set5:Set<String> = ["董六","张三","李四","王五"]
        
        if set1 == set5 {
            print("集合元素 比较 相等")
        } else {
            
            print("集合元素 比较 不相等")
        }
        
        if set3 == set4 {
            print("数组元素 比较 相等")
        } else
        {
            
            print("数组元素 比较 不相等")
        }
        
        if set3 == set6 {
            print("数组元素 比较 相等")
        } else
        {
            
            print("数组元素 比较 不相等")
        }
        
        
        
        
        
    }
    
    
    func updateBSet()  {
        
        var  stuList:Set<String> = ["张三" ,"李四","王五"]
        
        print(stuList)
        
        let removeSt = stuList.removeFirst()
        
        print(stuList)
        print(removeSt)
        
        
        stuList.insert("董六")
        
         print(stuList)
        
        let stu = "张三"
        
        stuList.remove(stu)
        
        
        print(stuList)
        
        if !stuList.contains(stu) {
            print("删除学生:\(stu) 成功")
        } else
        {
            print("删除学生:\(stu)  失败")
            
        }
        
        stuList.insert("诸葛亮")
        
        stuList.insert("司马懿")
        
        print("遍历集合:")
        
        for item in stuList {
            
            print(item)
            
        }
        
        for (index,val) in stuList.enumerated() {
            print("Item \(index + 1) : \(val)")
        }
        
        
        
    }
    
    
    
    
}







