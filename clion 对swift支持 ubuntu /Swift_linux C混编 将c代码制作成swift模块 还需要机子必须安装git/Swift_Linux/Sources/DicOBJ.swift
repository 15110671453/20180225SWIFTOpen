//
//  DicOBJ.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

class DicOBJ  {
    
    func testDic()  {
        
        print("测试字典:")
        
        var stuDic:Dictionary<Int,String> = [102:"张三",105:"李四",109:"王五"]
        
        print(stuDic)
        
        stuDic[110] = "刘备"
        
        print(stuDic)
        
        
        
        let dismissStudent = stuDic.removeValue(forKey: 102)
        
        print("删除的学生:\(dismissStudent!)")
        
        
        let replaceStu = stuDic.updateValue("关羽", forKey: 110)
        
        print("被替换的学生:\(replaceStu!)")
        
        print("遍历字典的键")
        
        for key in stuDic.keys {
            
            print("学号:\(key)")
            
        }
         print("遍历字典的值")
        
        
        for val in stuDic.values {
            
            print("学号:\(val)")
            
        }
        
        
        for (studentID,studentName) in stuDic {
            
            
            print("\(studentID):\(studentName)")
            
        }
        
        
    }
}













