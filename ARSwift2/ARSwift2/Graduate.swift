//
//  Graduate.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class Graduate: Student {
    
    var special:String = "打篮球"
    
    override func decription() -> String {
    
        return "\(name) 年龄是 \(age)  毕业于 \(school) 特长是 \(special)"
    }
    
    
    
}
