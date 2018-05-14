//
//  Worker.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class Worker: Person {

    var factory:String
    
    init(name: String, age: Int ,factory:String) {
        
        self.factory = factory
        
        super.init(name: name, age: age)
        
    }
    
    
    func  test() {
        
        let student1 = Student.init(name: "Tom", age: 18, school: "清华大学")
        
        let student2 = Student.init(name: "Ben", age: 28, school: "北京大学")
        
        let student3 = Student.init(name: "Tony", age: 38, school: "香港大学")
        
        
        let worker1 = Worker.init(name: "Tom", age: 18, factory: "政府")
        let worker2 = Worker.init(name: "Ben", age: 20, factory: "私企")
        
        let people = [student1,student2,student3,worker1,worker2]
        
        
         var studentCount = 0
        
        var workerCount = 0
        
        print("使用is 进行类型检查")
        
        for item in people {
            if item is Worker {
                
                workerCount = workerCount + 1
            } else if item is  Student {
                
                studentCount = studentCount + 1
            }
        }
        
        print("学生人数: \(studentCount)  工人人数: \(workerCount)")
    }
    
    func  doAnyAnyObject() {
        
        
    }
    
}
