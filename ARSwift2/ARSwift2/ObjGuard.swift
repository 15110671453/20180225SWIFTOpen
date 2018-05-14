//
//  ObjGuard.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

struct Blog {
    let name:String?
    
    let url:String?
    
    let author:String?
    
}

class ObjGuard: NSObject {

    
    
    func ifStyleBlog(blog:Blog)  {
        
        if let blname = blog.name {
            print("success \(blname) ")
        } else {
            
            print("failure")
        }
        
    }
    
    func guardStyleBlog(blog:Blog)  {
        
        guard let blname = blog.name else {
            print("可选型变量 为空")
            return
        }
        
        var i: Int64 = 0
        
        repeat {
            
            i = i + 1
            
            
        } while i * i < 100_000
        
        print("guard 条件表达式为 false 即 这里为空值时 执行false语句内容 跳转语句 可以是 return 如果是循环体中使用guard 就使用 break continue ")
        
        
    }
    
}
