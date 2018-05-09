//
//  CopyArrayVSDictionary.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation


class CopyArrayVSDictionary: NSObject {
    
    func testCopyDic()  {
        var ages = ["Peter": 23, "Wei": 35, "Anish": 65, "Katya": 19]
        
        var copiedAges = ages
        
        copiedAges["Peter"] = 24
        
        print("输出源字典是不是23--\(ages["Peter"])")
        // 输出 "23"
    }
    
    func testCopyArray() {
        
        var a:[Int] = [1, 2, 3]
        
        var b:[Int] = a
        
        var c:[Int] = a

        print(a[0])
        // 1
        print(b[0])
        // 1
        print(c[0])
        // 1
        print("修改了 a 的第一个元素 发现 b c 数组第一个元素也被修改了")
        a[0] = 42
        
        print(a[0])
        
        // 42
        print(b[0])
        
        // 42
        print(c[0])
        
        // 42
        
        print(b[1])
        
        // 42
        print(c[1])
        
        // 42
        
        a.append(4)
        a[0] = 777
        print(a[0])
        // 777
        print(b[0])
        // 42
        print(c[0])
        // 42
        print(b[1])
        // 42
        print(c[1])
        // 42
    }
    
}



