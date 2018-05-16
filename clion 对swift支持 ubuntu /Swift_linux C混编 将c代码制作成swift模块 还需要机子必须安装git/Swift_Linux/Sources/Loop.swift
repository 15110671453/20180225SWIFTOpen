//
//  Loop.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation


class Loop {
    
    func testLoop()  {
        
        for val in 1...10 {
            
            print("\(val)")
            
        }
        
        
        label1: for val in 2...8 {
            
            
            label2: for val2 in 1...4 {
                
                if val == val2 {
                    
                    break label1
                }
                
                print("(x,y) = (\(val),\(val2))")
                
                
            }
            
            
        }
        
    }
    
    
}










