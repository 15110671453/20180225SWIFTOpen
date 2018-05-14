//
//  DepartmentObj.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class DepartmentObj: NSObject {

    var no:Int = 10
    
    var name: String = "SALES"
    
    var comp: Company?
    
    var employees:[Employee] = [Employee]()
    
    
    func insertWithObject(anObject:AnyObject,index:Int) -> () {
        let emp = anObject as! Employee
        
        employees.insert(emp, at: index)
        
        
    }
    
}
