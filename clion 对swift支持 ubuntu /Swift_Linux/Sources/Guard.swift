//
//  Guard.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

class Guard {
    
    func testGuard()  {
        
        let folder = "swift.docx"
        
        guard folder.hasSuffix(".docx") else {
            
            print("当条件表达式为真时跳过else语句的内容 执行 语句组内容 else语句中 必须有条转语句结束 一般是 return break continue throw，return 与 throw 用于guard语句中 break 与 continue 用于一个循环体中的guard语句中")
            
            return
            
        }
        print("Guard 确保 guard的语句执行正确 如果失败 执行else")
        
        
        var  str = "Test Objective-C and Swift"
        
        str.insert(".", at: str.endIndex)
        
        print("插入字符后:\(str)")
        
        
        let startIndex = str.startIndex
        
        let endIndex = str.index(startIndex, offsetBy: 8)
        
        print("以上 指定 offset 偏移8 注意这里竟然不计算字符串中的空格符 ")
        
        let range = startIndex...endIndex
        
       let startI = range.lowerBound
        
      let endI =  range.upperBound
        
        let v1 = startI.encodedOffset
        
        let v2 = endI.encodedOffset
        
        let con = NSString.init(string: str)
        
        let sub = con.substring(with: NSRange.init(location: startI.encodedOffset, length: endI.encodedOffset))
        
        print("范围内容:\(sub)")
        
        str.removeSubrange(range)
        
        print("删除范围后:\(str)")
        
        str.replaceSubrange(range, with: "C++")
        
        print("注意这里竟然不计算字符串中的空格符 替换字符串后:\(str) ")
        
       
        
    }
}


