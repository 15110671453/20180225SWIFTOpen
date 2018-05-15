//
//  POBJ.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

/*Swift 类型属性
 https://www.yiibai.com/swift/type_properties.html
 
 类型属性
 
 实例的属性属于一个特定类型实例，每次类型实例化后都拥有自己的一套属性值，实例之间的属性相互独立。
 
 也可以为类型本身定义属性，不管类型有多少个实例，这些属性都只有唯一一份。这种属性就是类型属性。
 
 类型属性用于定义特定类型所有实例共享的数据，比如所有实例都能用的一个常量(就像 C 语言中的静态常量)，或者所有实例都能访问的一个变量(就像 C 语言中的静态变量)。
 
 对于值类型(指结构体和枚举)可以定义存储型和计算型类型属性，对于类(class)则只能定义计算型类型属性。
 
 值类型的存储型类型属性可以是变量或常量，计算型类型属性跟实例的计算属性一样定义成变量属性。
 
 提示    Swift的静态方法中也能使用self，这在其他面向对象的计算机语言中是不允许的。此时self表示当前数据类型，不代表枚举、结构体或类的实例。
 
 
 
 */
struct Point {
    var oldValue:String = ""
    var valueNew:String = ""
}

class POBJ: NSObject {
   
    static var VersionS:String?
    
    var message2:String = "" {
        /*
         存储属性 加了 属性监视器的 存储属性
         
         属性监视器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性监视器，甚至新的值和现在的值相同的时候也不例外
         
         全局或局部变量都属于存储型变量，跟存储属性类似，它提供特定类型的存储空间，并允许读取和写入。
         
         计算属性和属性监视器所描述的模式也可以用于全局变量和局部变量，全局变量是在函数、方法、闭包或任何类型之外定义的变量，局部变量是在函数、方法或闭包内部定义的变量。
         */
        willSet(newTotalSteps) {
        
            print("About to set message2 to \(newTotalSteps)")
            
        }
        
        didSet{
            if (POBJ.VersionS?.isEmpty)! {
                message2 = "初始化VersionS属性"
            }else {
                message2 = POBJ.VersionS!
            }
        }
    }
    
    static var mes = Point()
    
    class var message3:String {
        /*
         计算属性可以用于类、结构体和枚举里，存储属性只能用于类和结构体。
         这里是 计算属性
         
         class 修饰类型属性 类 只能用 计算属性
         */
        get{
            return mes.valueNew
        }
        set(mesV){
            if (POBJ.VersionS?.isEmpty)! {
                mes.valueNew = "初始化VersionS属性"
            }else {
                mes.valueNew = mesV
            }
        
        }
    }
    
    
    
    public  class  func managerCreate(message:String)
    {
        self.message3 = message
        
        print("\(self.VersionS)")
    }
    
    public func description(mes:String)  {
        
        
        print("\(mes)\(POBJ.VersionS)\(POBJ.message3)")
    }
    
    
}












