//
//  DispatchRunLoop.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/29.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation


class DispatchRunLoop {
    
    var loopState = 1
    
    
    /*
     很久没有写 swift
     
     注意  swift 的 init 初始
     
     与 func 关键字 方法定义 不可混用
     */
    
    init()  {
        
    }
    
    /*
     
     */
    var message = ""
    //MARK:这种模型通常被称作 Event Loop
    func loop()  {
        initialize()
//        var test = 1
//        do {
//
//
//        }while  (test != 1)
//
        /*
         do while  不能使用
         
         do-while' statement is not allowed; use 'repeat-while' instead
         
         而do用于捕捉异常
         
         swift4.0
         
         
         */
        var i2:Int = 0
        var sum2:Int = 0
        repeat{
            i2 += 1
            /*
             Unary operator '++' cannot be applied to an operand of type '@lvalue Int'
             */
            //sum2 = i2++ // 推荐写法 i += 1
            
            sum2 = i2
        }while(i2 <= 10)
        print(sum2)
        
        repeat {
            
            /*
             程序 至少执行一次
             然后 到 while 判断 条件
             
             条件为true 则继续
             */
            
            message = getNextMessage()
            
            process_message(mes: message)
            
        } while (message != "quit")
    }
    
    func process_message(mes:String)  {
        
        
    }
    
    func getNextMessage() -> String  {
        var  mes:String = ""
        
        return mes
        
    }
    
    func initialize()  {
        
    }
    
    
    
    
}

