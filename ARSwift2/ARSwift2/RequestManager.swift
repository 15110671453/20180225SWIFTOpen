//
//  RequestManager.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/10.
//  Copyright © 2018年 admindyn. All rights reserved.
//
import Alamofire
import Foundation




class RequestManager {
    
    let user = "user"
    
    let password = "password"
    
    //MARK:HTTP Basic Authentication
    func requestAutherationUrl()  {
        
        Alamofire.request("https://httpsbin.org/basic-auth/\(user)/\(password)").authenticate(user:user,password:password).responseJSON{
            response in
            print(response)
        }
    }
    
    func requestAutherationHeader() {
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
    
            let (key,value) = authorizationHeader
            
            headers[key] = value
        }
        
        Alamofire.request("https://httpbin.org/basic-auth/user/password",headers:headers).responseData {
            /*Swift 闭包写法 xcode 自动省略 闭包参数名 这里直接处理回调 没有将请求设置队列管理 还有一个队列方法*/
            (response) in
            print(response)
        }
        
    }
    
    
    
    
    
    
}
