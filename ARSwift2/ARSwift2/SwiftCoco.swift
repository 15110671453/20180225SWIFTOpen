//
//  SwiftCoco.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import Foundation
import UIKit

class SwiftCoco: NSObject {
    
    func testSet() {
        
        
        let weekArray:NSSet = ["set-1星期一","set-2星期二","set-3星期三","set-4星期四","set-5星期五"]
        for item in weekArray {
            
            print("\(item)")
        }
        
        
    }
    
    func testDict() {
        
        let keyString = "one two three four five"
        
        let keys = keyString.components(separatedBy: " ")
        
        let valueString = "alpha bravo charlie delta echo"
        
        let values = valueString.components(separatedBy: " ")
        
        let  dict = NSMutableDictionary(capacity:4)
        
        for (index,k) in keys.enumerated() {
            
        dict.setObject(values[index], forKey: k as NSString)
            
            
        }
        
        for item in dict {
            
            print("\(item)")
        }
        
        
    }
    
    func testArray() {
        
        let weekDays = ["星期一","星期二","星期三","星期四","星期五"," 星期六","星期日"]
        
        let  weekNames = NSArray(array:weekDays)
        
        for (index,value) in weekNames.enumerated()   {
            
            print("\(index) 是 \(value)")
        }
        
        for item in weekNames  {
            
            print("\(item)")
        }
        
        let mweeks:NSMutableArray = NSMutableArray(capacity:3)
        
        mweeks.add("北京-首都")
        
        mweeks.add("USA-美国")
        
        mweeks.add("韩国-Korea")
        
        for (index,value) in mweeks.enumerated() {
            
            print("\(index) is \(value)")
        }
        
        for item in mweeks as! [String] {
            
            print("\(item)")
        }
        
        
        
    }
    
    
    func  testString() {
        
        let  str1:NSString = "aBcDeFgHiJk"
        
        let  str2:NSString = "12345"
        
        let str3:String = "678910"
        
        var compareRusult: ComparisonResult
        
        var subRange:NSRange
        
        
        NSLog("字符串str1长度:%i", str1.length)

        //复制字符串到res
        
        var res = String(str1)
        
        NSLog("拷贝:%@", res)
        
        
        //复制字符串到str1的尾部
        
        let strS = str1.appending(str2 as String)
        
        NSLog("连接字符串:%@", strS)
        
        if str1 .isEqual(to: res as String ) {
            
            NSLog("str1 == res")
        } else {
            NSLog("str1 != res")
        }
        
        //测试字符串
        
        compareRusult = str1.compare(str2 as String)
        
        switch compareRusult {
        case .orderedAscending:
            NSLog("Str1 < Str2")
        case .orderedSame:
            NSLog("Str1 == Str2")
        
        default:
            NSLog("Str1 > Str2")
        }
        
        res = str1.uppercased
        
        NSLog("大写字符串%@", res)
        
        res = str1.lowercased
        
        NSLog("小写字符串%@", res)
        
        
        res = str1.substring(to: 3)
        
        NSLog("字符串前3个[0-1-2]字符%@", res)
        
        res = str1.substring(from: 4)
        
        NSLog("截取字符串 从索引4到尾部%@", res)
        
        var temp = str1.substring(from: 3)
        
        let stroc = "Objective - C"
        
        //MARK: 这里对OC过来的明显是引用类型
        
        let mstr:NSMutableString = NSMutableString(string:stroc)
        
        NSLog("可变字符串 %@", mstr)
        
        mstr.insert(" Java", at: 9)
        
        NSLog("可变字符串 %@", mstr)
        
        mstr.insert(" and C++", at: mstr.length)
        
        NSLog("可变字符串 %@", mstr)
        
        mstr.insert(" and This is", at: mstr.length)
        
        NSLog("可变字符串 %@", mstr)
        
        let search = "This is"
        
        let replace = "An Example of"
        
        subRange = mstr.range(of: search)
        
        
        
        if subRange.location != NSNotFound {
            
            mstr.replaceCharacters(in: subRange, with: replace )
            NSLog("可变字符串查找替换 %@", mstr)
            
        }
        
        subRange = NSMakeRange(16, 13)
        
    }
    
    func testNumber() {
        
        let number = NSNumber.init(value: 1_2345_6789)
        
       
        
        let numForma = NumberFormatter()
        
        numForma.numberStyle = .decimal
        
        let stringNumber = numForma.string(from: number)
        
        if stringNumber != nil {
            //十进制
            print("Decimal Style: \(stringNumber!)")
            
        }
        
        
        numForma.numberStyle = .scientific
        
        let stringNumber2 = numForma.string(from: number)
        
        if stringNumber2 != nil {
            //科学计数法
            print("Scientific Style: \(stringNumber2!)")
            
        }
        
        numForma.numberStyle = .currency
        
        let stringNumber3 = numForma.string(from: number)
        
        if stringNumber3 != nil {
            //货币
            print("Currency Style: \(stringNumber!)")
            
        }
        
        
        
        
        for localId in ["en_US","fr_FR","zh_CN"] {
            
            numForma.locale = NSLocale(localeIdentifier:localId) as Locale!
            
            //货币
            
            numForma.numberStyle = .currency
            
           let stringNumberC = numForma.string(from: number)
            
            print("\(localId) : Currency Style: \(stringNumberC!)")
            
        }
        
        
        
        
    }
    
}
