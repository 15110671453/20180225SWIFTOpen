//
//  CICGImageView.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation
import CoreImage

class CICGImageView {
    
    /*
     在Swift3中，闭包默认是非逃逸的。在Swift3之前，事情是完全相反的：那时候逃逸闭包是默认的，对于非逃逸闭包，你需要标记@noescaping。Swift3的行为更好。因为它默认是安全的：如果一个函数参数可能导致引用循环，那么它需要被显示地标记出来
     */
    //MARK:Swift3中，闭包默认是非逃逸的
    //MARK:@escaping标记可以作为一个警告，来提醒使用这个函数的开发者注意引用关系
    
   
    
    //MARK:旧色调滤镜
    func filterSepiaTone(value:Float,imageCG:CGImage,width:Int,height:Int,completion:@escaping(_ imageCG:CGImage?,_ information:String)->()) {
        
        let context = CIContext(options:nil)
        
        let cImage = CIImage.init(cgImage: imageCG)
        
        let sepiaTone = CIFilter(name:"CISepiaTone")
        
        sepiaTone?.setValue(cImage, forKey: "inputImage")
        
        let text = String.init(format: "旧色调 Intensity:%.2f", value)
        
        sepiaTone?.setValue(value, forKey: "inputIntensity")
        
        var result = sepiaTone?.value(forKey: "outputImage")
        
        let imageRef = context.createCGImage(result as! CIImage, from: CGRect(x:0,y:0,width:width,height:height))
        
        if (imageRef != nil) {
           completion(imageRef,text)
        }
        
        
        
        
        
        
    }
    
    //高斯模糊滤镜
    func filterGaussianBlur(value:Float,imageCG:CGImage,width:Int,height:Int,completion:@escaping(_ imageCG:CGImage?,_ information:String)->()) {
        
        let context = CIContext(options:nil)
        
        let cImage = CIImage.init(cgImage: imageCG)
        
        let gaussianBlur = CIFilter(name:"CIGaussianBlur")
        
        gaussianBlur?.setValue(cImage, forKey: "inputImage")
        
        let text = String.init(format: "高斯模糊 Radius:%.2f", value)
        
        gaussianBlur?.setValue(value, forKey: "inputRadius")
        
        var result = gaussianBlur?.value(forKey: "outputImage")
        
        let imageRef = context.createCGImage(result as! CIImage, from: CGRect(x:0,y:0,width:width,height:height))
        
        if (imageRef != nil) {
            completion(imageRef,text)
        }
      
        
        
        
        
        
    }
    
}











