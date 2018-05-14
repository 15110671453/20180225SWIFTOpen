//
//  ObjSwitch.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class ObjSwitch: NSObject {

    let student = (id:"1002",name:"李四",age:28,chineseScore:90,englishScore:91)
    
    func doSwitch(tuple:(id:String,name:String,age:Int,chineseScore:Int,englishScore:Int)) {
        
        var desc:String
        
        switch tuple {
        case (_,_,let AGE,90...100,90...100):
            if AGE > 30 {
                
                desc = "老优"
                
            } else {
                
                desc = "小优"
                
                fallthrough
            }
        case (_,_,_,80..<90,80..<90):
          desc = "良"
        case (_,_,_,60..<80,60..<80):
            desc = "中"
        case (_,_,_,60..<80,90..<100),(_,_,_,90..<100,60..<80):
            desc = "偏科"
        case (_,_,_,0..<80,90..<100),(_,_,_,90..<100,0..<80):
            desc = "严重偏科"
        default:
             desc = "无"
        }
        
        print("说明: \(desc)")
        
    }
    
}
