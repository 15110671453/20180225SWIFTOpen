//
//  main.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/3/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//

/*swift  设计模式*/

/*
 swift中是不能使用宏定义语法的，
 #define  VALUE_TYPE_INT
 */


import Foundation
//MARK: Handle Code


let rl = RunLoop_SWF()

rl.test()


let redis = Redis_Handler()

redis.test()


let danli = FanXing_SWF()

danli.test()


let cPtr = CPointer_SWF()

cPtr.test()


let bSW = BasicSWF()

bSW.test()




































//MARK:RunLoopConfig
let runLoop = CFRunLoopGetCurrent()

let firedate = CFAbsoluteTimeGetCurrent()

let distantdate = NSDate.distantFuture

let doubledistant = CFDateGetTimeIntervalSinceDate(CFDateCreate(kCFAllocatorDefault, firedate), CFDateCreate(kCFAllocatorDefault, kCFAbsoluteTimeIntervalSince1970))

var info = "main"

var timerContext:UnsafeMutablePointer<CFRunLoopTimerContext>? = nil

var timerCon:CFRunLoopTimerContext? = nil

withUnsafePointer(to: &info, { (pinfo:UnsafePointer) -> String in
    
    timerCon = CFRunLoopTimerContext.init(version: 0, info:UnsafeMutableRawPointer(mutating: pinfo), retain: nil, release: nil, copyDescription: nil)
    
    return ""
})

withUnsafePointer(to: &timerCon, { (p:UnsafePointer) -> String in
    
    let praw = UnsafeMutableRawPointer(mutating: p)
    
    timerContext = praw.bindMemory(to: CFRunLoopTimerContext.self, capacity: 1)
    
    return ""
})


let timer  = CFRunLoopTimerCreate(kCFAllocatorDefault, firedate,20, 0, 0, { (timer:CFRunLoopTimer?, p:UnsafeMutableRawPointer?) -> Void in
    
    //MARK:主队列 任务
    
    
    print("test main \(CFDateCreate(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent()))")
    
} , timerContext)

//CFRunLoopTimerSetNextFireDate(timer, 30)

let repeatState = CFRunLoopTimerDoesRepeat(timer)

if repeatState {
    
    print("定时器 永久定时任务")
    
}

CFRunLoopAddTimer(runLoop, timer,CFRunLoopMode.defaultMode )


CFRunLoopRun()

print("RunLoop main BackEnd")
