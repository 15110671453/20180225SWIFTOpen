//
//  Employee.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

struct Acount {
    var amount:Double = 0.0 //账户金额
    
    var owner:String = "" //账户名
    
    //静态属性
    static var interestRate:Double = 0.068 //账户利率
    //静态计算属性
    static var staticProp:Double {
        
        return interestRate * 1_000_000
    }
    //实例计算属性
    var instanceProp:Double {
        
        return Acount.interestRate * amount
        
    }
}

struct Department {
    var no:Int = 0 //部门编号
    var name: String = "" // 部门名称属性
    
    //运算符重载
    
    static func == (lhs:Department,rhs:Department)->Bool
    {
        return lhs.name == rhs.name && lhs.no == rhs.no
        
    }
    
    static func != (lhs:Department,rhs:Department) -> Bool {
        
        if (lhs.name != rhs.name || lhs.no != rhs.no) {
        
            return true
            
        }
        
        return false
    }
    var employees:[Employee] = [Employee]()
    
    let employees2 = NSMutableArray()
    
    mutating func insertWithObject(anObject:AnyObject,index:Int) -> () {
        //Cannot use mutating member on immutable value: 'self' is immutable
        //Mark method 'mutating' to make 'self' mutable
        
        print("变异方法 强调在结构体和枚举的方法中不能修改值类型变量属性 如果想要修改 必须将方法定义为变异的 如果是类中修改值类型的属性 不需要方法是变异的 第二 在结构体与枚举方法中可以修改引用类型属性 不需要 是变异的")
        let emp = anObject as! Employee
        
        employees.insert(emp, at: index)
        
        
    }
    
    func insertMutableArray(anObject:AnyObject,index:Int) -> () {
        
        let emp = anObject as! Employee
        
        employees2.insert(emp, at: index)
    }
    
}

class Employee: NSObject {

    var no:Int = 0 //员工编号
    
    //静态属性
    static var empLocal:String = "Chinese"
    
    
    
    var name:String = "" {
        //员工姓名
        willSet(newName){
            print("属性观察者 在修改之前调用")
            print("\(newName)")
            
        }
        
        didSet(oldName){
               print("属性观察者 在修改之后调用")
              print("\(oldName)")
        }
        
    }
    
    var job:String = "" //员工职能
    
    var firstName:String = "Tony"
    
    var lastName:String = "Guan"
    
    /*类中使用 值类型的结构体 使用懒加载技术 延迟加载*/
    
    lazy var dept :Department? = Department()//所在部门
    
    //闭包 避免强循环引用
    lazy var fullNameBlock:()->String = {
        [weak self] ()->String in
        
        print("Block1 输出1")
        
        let fn = self!.firstName
        let ln = self!.lastName
        
        return fn + "." + ln
        
    }
    
    lazy var fullNameBlock2:()->String = {
        
        [unowned self] in
        
        print("Block2 输出2")
        
        let fn = self.firstName
        let ln = self.lastName
        
        return fn + "." + ln
        
        
    }
    
    //MARK: 这里处理闭包
    
    lazy  var  fullNameBlock3:(_ firstN:String,_ lastN:String)->String = {
        
        //FIXME:注意这里 避免循环引用 内存释放
        
        [weak self] (_ firstN:String,_ lastN:String) in
        
        print("Block3 输出3")
        return firstN + "." + lastN
        
        
    }
    var deptObj:DepartmentObj?
    
    var fullName:String {
        
        get {
            
            print("计算属性Get")
            
            return firstName + "." + lastName
            
        }
        
        set (newFullName) {
            print("计算属性Set")
            var name = newFullName.components(separatedBy: ".")
            
            firstName = name[0]
            
            lastName = name[1]
            
        }
    }
    //静态方法
    
    static func testFunc() {
        
        print("Swift中静态方法 与OC中不同 在静态方法中可以使用Self关键字 此时Self代表当前数据类型 不代表枚举 结构体 或 类的实例")
    }
}
