//
//  AppPathManager.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation
import UIKit

class AppPathManager:NSObject, FileManagerDelegate {
    
    //MARK:FileManagerDelegate
    func fileManager(_ fileManager: FileManager, shouldCopyItemAtPath srcPath: String, toPath dstPath: String) -> Bool
    {
        //MARK:在复制操作执行前 最后一次修改机会
        
        
        return true
        
    }
    
    func fileManager(_ fileManager: FileManager, shouldProceedAfterError error: Error, copyingItemAtPath srcPath: String, toPath dstPath: String) -> Bool
    {
        //MARK:处理文件复制遇到的错误
        
        print("处理文件复制遇到的错误:\(error.localizedDescription)")
        return false
        
    }
    
    
    var fileName:String?
    
    func createdEditableCopyOfDataBaseIfNeeded(fileNameS:String,completion:(_ image:UIImage?)->())  {
        /*将已经下载的图片 复制到沙箱目录下*/
        
        let fileManager = FileManager.default
        //MARK:沙箱目录获取-我们下载文件一般到这里
        let writeablePath  =  applicationDocumentsDirectoryFile(fileN: fileNameS)
        
        let doexsits = fileManager.fileExists(atPath: writeablePath)
        
        if !doexsits {
            //MARK:沙箱目录中如果不存在图片 则从应用程序包中复制一个图片到沙箱中
            
            //MARK:应用程序包目录-就是我们工程开发时拖拽进去的图片资源们所在目录
            
            print("沙箱目录无该图片 从 资源目录 复制")
            
            /*
             let defaultPath = Bundle.main.resourcePath?.appending("/\(fileNameS)")
             */
            
            let strNS:NSString = fileNameS as NSString
            
           
            
            let s = strNS.deletingPathExtension
            let s2 = strNS.pathExtension
            
            let defaultPath = Bundle.main.path(forResource:s, ofType:s2)
            
             //MARK:FileManagerDelegate need
            
            /*
             Swift 不同于 OC的 地方 文件 复制 操作 结果反馈 处理需要遵守FileManager的代理协议
             */
            
            fileManager.delegate = self
            
            try! fileManager.copyItem(atPath: defaultPath!, toPath: writeablePath)
            
            
            let imageD = UIImage.init(contentsOfFile: writeablePath)
        
            completion(imageD)
        } else {
            
            print("文件已经存在")
            
        }
        
        
    }
    
    //MARK:服务器加载资源
    func loadWebService(urlStr:String,completion:(_ image:UIImage?)->()) {
        
        let url = NSURL(string:urlStr)
        
        do {
            let data = try? Data.init(contentsOf: url! as URL, options: .uncachedRead)
            
            let image:UIImage = UIImage.init(data: data!)!
            
            completion(image)
            
        } catch is CocoaError{
            
        }
        
        
        
       
        
        
    }
    //MARK:沙箱加载资源
    func loadSandBox(fileNameS:String, completion:(_ image:UIImage?)->())  {
        
        let path = self.applicationDocumentsDirectoryFile(fileN: fileNameS)
        
        let imageB:UIImage? = UIImage.init(contentsOfFile: path)
        
        if let  im = imageB {
           completion(im)
            
        } else {
            
            print("没有这张图片")
        }
        
        
        
    }
    
    //MARK:资源目录加载资源
    func loadBundle(fileNameS:String, completion:(_ image:UIImage?)->())  {
        
        /*
         
         
         
        
         */
        let strNS:NSString = fileNameS as NSString
        
        let s = strNS.deletingPathExtension
        
        let s2 = strNS.pathExtension
        
        let path = Bundle.main.path(forResource:s, ofType: s2)
        
         let path2 = Bundle.main.resourcePath?.appending("/\(fileNameS)")
        
        if path == path2 {
            print("文件路径一致")
        }
        
        let image = UIImage.init(contentsOfFile: path!)
        
        completion(image)
        
    }
    
    func applicationDocumentsDirectoryFile(fileN:String = "") -> String {
        
      
        
        let documentDirectorys:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let documentDirectory:String = documentDirectorys[0] as! String
        
        
       
            
            if !(fileN == "") {
                
                print("使用外部传参")
                /*
                 let path = documentDirectory.appending("/\(fileN)")
                 
                 不可取  这种 不加目录分割符
                 还要自己加
                 */
                
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let fileURL = documentsURL.appendingPathComponent(fileN)
                
                let path = documentDirectory.appending("/\(fileN)")
                
              
                print("\(path)")
                print("\(fileURL.absoluteString)")
                
                return path
               
                
            } else {
                
                if let nameFile = fileName {
                    
                    /*
                     let path = documentDirectory.appending("/\(fileN)")
                     
                     不可取  这种 不加目录分割符
                     还要自己加
                     */
                    
                    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    let fileURL = documentsURL.appendingPathComponent(fileName!)
                    
                     let path = documentDirectory.appending("/\(fileN)")
                    print("\(fileURL.absoluteString)")
                   
                    
                    return path
                    
                } else {
                    
                    return ""
                }
                
                
            }
        
        
      
        
        
    }
}


