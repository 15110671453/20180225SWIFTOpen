//
//  ImageRequestor.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/10.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Alamofire
import Foundation
import UIKit


class ImageRequestor {
    private var resumeData:Data?
    private var image:UIImage?
    //MARK:-FetchRequest
    func fetchImage(urlString:String,completion:@escaping (UIImage?)-> ())  {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("pig.png")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        print("异步下载图片准备")
        Alamofire.download(urlString, to: destination).response { response in
            
            print("异步下载回执-response-normal")
            //print(response)
            
            if response.error == nil, let imagePath = response.destinationURL?.path {
                
                print("异步下载图片完毕-normal")
                
                let image = UIImage(contentsOfFile: imagePath)
                
                completion(image)
            }
        }
        
        print("异步下载图片准备完毕")
    }
    //MARK:resume data-FetchRequest
    func fetchImageResumeData(urlString:String,completion:@escaping (UIImage?)-> () )  {
        /*Guard 条件表达式 为false 执行 guard 语句块  这里 如果guard 条件为false 执行语句块 也就是image 不为nil 时 执行语句块
         
         */
        guard image == nil else {
            completion(image);
            return
        }
        
        let destination:DownloadRequest.DownloadFileDestination = {
            (_,_) in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("resume.png")
            
            return (fileURL,[.removePreviousFile,.createIntermediateDirectories])
            
        }
        
        let request:DownloadRequest
        /*
         If a `DownloadRequest` is cancelled or interrupted, the underlying URL session may generate resume data for the active `DownloadRequest`. If this happens, the resume data can be re-used to restart the `DownloadRequest` where it left off. The resume data can be accessed through the download response, then reused when trying to restart the request.
         */
        print("异步下载图片准备")
        if let resumeData = resumeData {
             print("异步下载resumeData")
            request = Alamofire.download(resumingWith: resumeData)
        } else {
            
            request = Alamofire.download(urlString,to: destination)
            
        }
        
        
        
        request.responseData {
            /*因为这里 request responseData 接收的参数是闭包 这里是swift闭包传递的写法*/
            (response) in
            
            print("异步下载回执-resumeData")
            
            switch response.result {
                
            case .success(let data):
                print("异步下载成功-resumeData")
                self.image = UIImage(data:data)
                completion(self.image)
            case .failure:
                print("异步下载失败-resumeData")
                self.resumeData = response.resumeData
                
                
            }
            }.response { (response) in
                
                if response.error == nil, let imagePath = response.destinationURL?.path {
                    
                    print("异步下载图片完毕-resumeData2")
                    
                    let image = UIImage(contentsOfFile: imagePath)
                    
                    completion(image)
                }
        }
        
        print("异步下载图片准备完毕")
        
    }
    
    
    //
    
    func fetchImageProgress(urlString:String,completion:@escaping (UIImage?)-> ())  {
        let  utilityQueue =  DispatchQueue.global(qos:.utility)
        print("异步下载图片准备")
        
        let destination:DownloadRequest.DownloadFileDestination = {
            (_,_) in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("resume2.png")
            
            return (fileURL,[.removePreviousFile,.createIntermediateDirectories])
            
        }
        Alamofire.download(urlString,to: destination)
            .downloadProgress(queue: utilityQueue) { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                 print("异步下载回执-progress")
                if let data = response.result.value {
                    
                    print("异步下载图片完毕-Progress")
                    
                    let image = UIImage(data: data)
                    completion(image)
                    
                } else {
                     print("异步下载图片失败-Progress")
                }
            }.response { (response) in
                if response.error == nil, let imagePath = response.destinationURL?.path {
                    
                    print("异步下载图片完毕-Progress2")
                    
                    let image = UIImage(contentsOfFile: imagePath)
                    
                    completion(image)
                }
            }
        
        print("异步下载图片准备完毕")
        
    }
    
    //MARK:upload to server
    
    func uploadFile(urlDestination:String)  {
        let fileURL = Bundle.main.url(forResource:"video",withExtension:"mov")
        

        Alamofire.upload(fileURL!, to: urlDestination).responseJSON { (response) in
            
            print(response)
        }
        
        
    }
    func uploadData(image:UIImage)  {
        
        let imageData = UIImagePNGRepresentation(image)!
        
        Alamofire.upload(imageData, to: "https://httpbin.org/post").responseJSON { response in
            
            print(response)
        }
    }
    //rainbow.jpg unicorn.png
    func uploadMultipleFile(unicornImageName:String,rainbowImageName:String)  {
        //MARK:几个应用程序主要的Path
        let pathBundle = Bundle.main.resourcePath
        
        let pathBundle2 = Bundle.main.bundlePath
        
        let pathBundle3 = Bundle.main.executablePath
        
        let unicornImageURL = Bundle.main.url(forResource: unicornImageName, withExtension: ".png")
        
        let rainbowImagePath = Bundle.main.path(forResource: rainbowImageName, ofType: ".jpg")
        
    
        let rainbowImageURL = NSURL.fileURL(withPath: rainbowImagePath!)
        
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(unicornImageURL!, withName: "unicorn")
                multipartFormData.append(rainbowImageURL, withName: "rainbow")
        },
            to: "https://httpbin.org/post",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                       // debugPrint(response)
                        
                        print("上传图片 回执成功")
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        }
        )
        
        
    }
    
}
/*
 比较 Block 在OC  与 Swift  在传递时的写法
 
 
 //OC中Block传值
 -(void)loadData:(  void(^)(NSArray *) )completetion
 {
 
 //这里暂时先忽略掉线程，简单处理，重点在swift闭包
 NSLog(@"耗时操作");
 
 sleep(2);//模拟网络请求
 
 NSArray *arr=@[@"1",@"2"];
 
 NSLog(@"主线程回调");
 
 
 completetion(arr); //返回获得的数据
 
 }
 
 调用：
 [self loadData:^(NSArray *callBack){
 
 NSLog(@"%@,%@",callBack[0],callBack[1]);
 
 }];
 
 输出：
 2017-03-22 18:48:45.273 tessst[3642:187462] 耗时操作
 2017-03-22 18:48:47.345 tessst[3642:187462] 主线程更新
 2017-03-22 18:48:47.346 tessst[3642:187462] 1,2
 
 
 //swift中闭包传值
 func loadDate(completion: @escaping (_ result : [String])->()) -> () {
 
 //这里有一个很重要的参数 @escaping，逃逸闭包
 //简单来说就是 闭包在这个函数结束前内被调用，就是非逃逸闭包，调用的地方超过了这函数的范围，叫逃逸闭包
 //一般网络请求都是请求后一段时间这个闭包才执行，所以都是逃逸闭包。
 // 在Swift3.0中所有的闭包都默认为非逃逸闭包，所以需要用@escaping来修饰
 DispatchQueue.global().async {
 
 print("耗时操作\(Thread.current)")
 Thread.sleep(forTimeInterval: 2)
 let json=["1","2"]
 
 DispatchQueue.main.async {
 print("主线程更新\(Thread.current)")
 
 completion(json)
 //函数在执行完后俩秒，主线程才回调数据，超过了函数的范围，这里就是属于逃逸闭包，如果不用@escaping，编译器是编译不过的
 }
 }
 }
 
 主函数调用loadDate:
 loadDate { (callBack) in
 print("\(callBack)")
 }
 
 输出值
 耗时操作<NSThread: 0x608000069140>{number = 1, name = main}
 主线程更新<NSThread: 0x608000069140>{number = 1, name = main}
 */
