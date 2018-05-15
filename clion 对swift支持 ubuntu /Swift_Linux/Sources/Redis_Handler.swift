 //
 //  Redis_Handler.swift
 //  SwiftBasicMac
 //
 //  Created by admindyn on 2018/5/14.
 //  Copyright © 2018年 admindyn. All rights reserved.
 //
 
 
 //MARK:Process
 #if os(Linux)
    import SwiftGlibc
 let WUNTRACED = Int32(2)
 let WNOHANG = Int32(1)
 let SIGTERM = Int32(15)
 #else
    import Darwin
 #endif
 
import Foundation

 /*
  设计模式
  https://legacy.gitbook.com/book/yourtion/swiftdesignpatterns/details
  
  如何在Swift中调用C
  比如 Redis 数据库的使用
  
  http://hearrain.com/2015/12/850
  
  首先 明确c中const 使用规则
  
  只有被const直接修饰的变量最终指向的内容不可变（忽略变量类型修饰符，即int， long等）。
  
  在const int *p中，忽略掉int，被const直接修饰的是*p，*p最终指向指针p指向的地址的内容，所以该内容不可变（至少不可以使用*p进行修改），而变量p没有被const直接修饰，所以指正变量p最终指向的内容（也就是p本身的值）是可变的。这样这一句可以等效于int const *p。（这两种声明有没有其他的不同之处，笔者暂时还不清楚）
  
  在int * const p中，指针变量p本const直接修饰，所以p的内容（地址）是不可变的，而p指向的地址的内容（即*p）没有被const直接修饰，所以p指向的地址的内容是可变的，即*p可以被再赋值
  
  Swift 中 UnsafePointer<Type>  等同于 C指针
  const Type* p
  
  UnsafeMutablePointer<Type> 等同于 C指针 Type* p
  
  */
 
class Redis_Handler {
    
    func test()  {
       
      
        //MARK:- redis redis
        let conn:UnsafeMutablePointer<redisContext>  = redisConnect("192.168.3.236",6379)
        
        
        
        print(conn.pointee)
        
        var command = "keys *"
        
        let byteCountRedis = MemoryLayout<redisReply>.stride
        //MARK: - Redis
        let pCommandState = command.withCString { ( p:UnsafePointer<Int8>) -> Int8 in
            
            var state = 0
            
            //应答结构体 指针
            let reply:UnsafeMutablePointer<redisReply> = redisSendCommand(conn, p)
            //应答结构体  值
            let element = reply.pointee
            /*
             根据返回的类型 我们知道reply 要让我们解析 结构体中的数组
             */
            let type = element.type
            var  elementsCount = element.elements
            //应答结构体数组 第一个结构体 指针
            let elePtr:UnsafeMutablePointer = element.element
            //应答结构体数组 第一个结构体 指针 值
            let vPtr:UnsafeMutablePointer  = elePtr.pointee!
            //应答结构体数组 第一个结构体  值
            let value1 = vPtr.pointee
            //应答结构体数组 第一个结构体的 Str指针
            let str1Ptr = value1.str
            
            
            //应答结构体数组 第一个结构体的 Str指针 值 但是是字节序  第一个字节的值
            let strCon1 = str1Ptr?.pointee
            
            print("key1 只获得了字符串 第一个字节的值:\(String(describing: strCon1))")
            let strRaw1 = UnsafeMutableRawPointer(str1Ptr)
            
            let strData1 = Data.init(bytesNoCopy: strRaw1!, count: value1.len, deallocator: Data.Deallocator.none)
            
            let strReal1 = String(data:strData1, encoding: String.Encoding.utf8)!
            
            
            
            print("redis数据库中key1:\(strReal1)")
            
            let v2Ptr:UnsafeMutablePointer  = (elePtr + 1).pointee!
            
            let value2 = v2Ptr.pointee
            let str2Ptr = value2.str
            let strCon2 = str2Ptr?.pointee
            
            print("key2 只获得了字符串 第一个字节的值:\(String(describing: strCon2))")
            
            let strRaw2 = UnsafeMutableRawPointer(str2Ptr)
            
            let strData2 = Data.init(bytesNoCopy: strRaw2!, count: value2.len, deallocator: Data.Deallocator.none)
            
            let strReal2 = String(data:strData2, encoding: String.Encoding.utf8)!
            
            
            
            print("redis数据库中key2:\(strReal2)")
            
            var index_v_Increace = 0
            
            
            repeat {
                
                let v_Ptr:UnsafeMutablePointer  = (elePtr + index_v_Increace).pointee!
                
                let value_Ptr = v_Ptr.pointee
                
                let str_Ptr = value_Ptr.str
                
                let str_Con = str_Ptr?.pointee
                
                print("key 只获得了字符串 第一个字节的值:\(String(describing: str_Con))")
                
                let str_Raw = UnsafeMutableRawPointer(str_Ptr)
                
                let str_Data = Data.init(bytesNoCopy: str_Raw!, count: value_Ptr.len, deallocator: Data.Deallocator.none)
                
                let str_Real = String(data:str_Data, encoding: String.Encoding.utf8)!
                
                
                
                print("redis数据库中key :\(str_Real)")
                
                elementsCount = elementsCount - 1
                
                index_v_Increace = index_v_Increace + 1
                
                
            }while(elementsCount > 0)
            
            
            
            
            
            
            return Int8(state)
        }
        
        
        
    
    

    }
}

