//
//  SquareMatrix.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class SquareMatrix: DoubleDimensionalArray {
    
  override  subscript(row:Int,col:Int)->Int {
    
    get {
       
        return super.grid[(row * columns) + col]
    }
    set {
        
        super.grid[(row * columns) + col] = newValue * newValue
    }
        
    }

}
