//
//  CutomViewImage.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class CutomViewImage: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        UIColor.brown.setFill()
        UIRectFill(rect)
        
    UIColor.white.setStroke()
        
        let frame = CGRect(x:10,y:30,width:100,height:300)

        UIRectFrame(frame)
        
        
        let imagePath = Bundle.main.path(forResource: "meinv", ofType: ".jpg")
        
        if let path = imagePath {
           
            let imageObj = UIImage.init(contentsOfFile:path)
             imageObj?.draw(in: CGRect(x:10,y:340,width:100,height:100))
            
        }
        
        
        let font = UIFont.systemFont(ofSize: 34)
        
        let attr  = [kCTFontAttributeName:font]
        
        let title:String = "我的女神"
        
        let nsTitle:NSString = title as NSString
        
        nsTitle.draw(at: CGPoint(x:10,y:450), withAttributes: attr as [NSAttributedStringKey : Any])
        
        
        
        
        
        
        
       
        
        
    }

}
