//
//  DoubleDimensionalArray.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class DoubleDimensionalArray: NSObject {
    
    
    let rows:Int ,columns:Int
    
    var grid:[Int]
    
     init(rows:Int,columns:Int ) {
        
        self.rows = rows
        self.columns = columns
        
        grid = Array(repeating:0, count:rows * columns)
        
        super.init()
        
    }
    
    subscript(row:Int,col:Int)->Int {
        
        get {
            
            return grid[(row*columns) + col]
            
        }
        
        set {
            
            grid[(row * columns) + col] = newValue
            
        }
        
    }
    

}
