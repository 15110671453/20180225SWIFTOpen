//
//  Note.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class Note: NSObject {

    var date:NSDate?
    
    var  content:String?
    
    
    init(date:NSDate?,content:String?) {
        
        self.date = date
        
        self.content = content
        
        super.init()
    }
    
    
    
    
}
