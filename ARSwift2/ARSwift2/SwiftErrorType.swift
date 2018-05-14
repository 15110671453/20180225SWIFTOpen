//
//  SwiftErrorType.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import Foundation
import UIKit

//MARK: 枚举没有继承 只有遵守协议
enum DAOError:Error
{
    case NoData
    case PrimaryKeyNull
}

class SwiftErrorType: NSObject {

    func remove(model:Employee) throws {
        
        guard let name = model.dept?.name else {
            
            //抛出“主键为空”错误
             print("guard 条件为假 抛出异常")
            throw DAOError.PrimaryKeyNull
        }
        
        print("guard 条件为真 没有异常 处理完毕")
        
    }
    
    func testError() throws {
        
        let emp =  Employee.init()
        
        do {
        
            print("这里 remove 方法 声明为 throws 方法 因为要抛出异常")
            
            print("而在我们这个方法里 没有 声明throws 是因为我们这里要在 try! 打破错误传播链条")
            
            
            
          print("用try 执行异常 方法 没必要用 do-catch 语句包裹起来")
        //try! remove(model: emp)
            guard emp.dept != nil else {
                
                throw DAOError.NoData
            }
            
        } catch DAOError.NoData {
            print("没有数据")
        } catch DAOError.PrimaryKeyNull {
            print("主键为空")
        }
        
    }
    
    
}
