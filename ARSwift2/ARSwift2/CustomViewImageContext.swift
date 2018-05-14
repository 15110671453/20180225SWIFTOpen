//
//  CustomViewImageContext.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class CustomViewImageContext: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x:75,y:10))
        context?.addLine(to: CGPoint(x:10,y:150))
        context?.addLine(to: CGPoint(x:160,y:150))
        
        context?.closePath()
        
        //
        UIColor.black.setStroke()
        
        
        
        UIColor.green.setFill()
        
        //第一次 设置 绿色填充
        //并保存设置
        context?.saveGState()
        
        UIColor.red.setFill()
        //第二次 换了 红色 感觉不合适 撤销换回绿色
        
        context?.restoreGState()
        
        
    context?.drawPath(using: .fillStroke)
        
        
    }

}
