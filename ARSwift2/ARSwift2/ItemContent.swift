//
//  ItemContent.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation


class ItemContent {
    
    var itemName:String = ""
    
    var brandName:String = ""
    
    var isBuy = false
    
    
    var imageName:String = ""
    
    
    init(itemName:String,brandName:String,isBuy:Bool,imageName:String) {
        self.itemName = itemName
        
        self.brandName = brandName
        
        self.isBuy = isBuy
        
        self.imageName = imageName
    }
    
    
    convenience init(itemName:String,imageName:String) {
        self.init(itemName: itemName, brandName: "dyn-shop", isBuy: false, imageName: imageName)
    }
    
    convenience init(itemName:String) {
        self.init(itemName: itemName, brandName: "dyn-shop", isBuy: false, imageName: "")
    }
    
    func description() -> String {
        
        
        return "itemName:\(itemName) brandName:\(brandName) isBuy:\(isBuy) imageName:\(imageName)"
    }
    
    
    

}
