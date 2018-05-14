//
//  ObjT.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

struct StringQueue {
    
    var items = [String]()
    
    mutating func queue(item:String) {
        
        items.append(item)
        
    }
    
    mutating func dequeue()->String? {
        
        if items.isEmpty {
            
            return nil
            
        } else {
            
            return items.remove(at: 0)
            
        }
        
        
    }
}

struct Queue<T> {
    
    var items = [T]()
    
    mutating func queue(item:T) {
        
        items.append(item)
        
    }
    
    mutating func dequeue()->T? {
        
        if items.isEmpty {
            
            return nil
            
        } else {
            
             return items.remove(at: 0)
            
        }
        
    }
    
}


extension Queue {
    
    func peek(position:Int) -> T? {
        
        if position < 0 || position > items.count {
            
            return nil
            
        } else {
            
            return items[position]
            
        }
        
    }
    
}

class ObjT: NSObject {

}
