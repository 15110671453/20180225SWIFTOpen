//
//  ObjRange.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/4.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class ObjRange: NSObject {
    
    var rangeX = 1...10
    
    
    func test() {
        
        for vl in rangeX {
            
            print("输出：\(vl)")
        }
       
    }
    
    

}
