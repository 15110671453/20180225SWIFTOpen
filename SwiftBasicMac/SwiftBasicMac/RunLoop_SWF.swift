//
//  RunLoop_SWF.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/14.
//  Copyright © 2018年 admindyn. All rights reserved.
//


/*
 Swift 沿用 OC的三种线程技术
 NSThread
 
 控制线程通讯 使用
 Condition不是锁，而是条件。一个锁可能关联一个或多个条件。wait将线程休眠，signal将线程唤醒
 
 OperatinQueue
 
 Operation Group
 
 GCDQueue
 
 GCD 线程通讯 使用 信号量
 
 Swift 使用Runloop
 
 
 */


import Foundation
/*
 Run loops are part of the fundamental infrastructure associated with threads. A run loop is an event processing loop that you use to schedule work and coordinate the receipt of incoming events. The purpose of a run loop is to keep your thread busy when there is work to do and put your thread to sleep when there is none.
 
 Run loop management is not entirely automatic. You must still design your thread’s code to start the run loop at appropriate times and respond to incoming events. Both Cocoa and Core Foundation provide run loop objects to help you configure and manage your thread’s run loop. Your application does not need to create these objects explicitly; each thread, including the application’s main thread, has an associated run loop object. Only secondary threads need to run their run loop explicitly, however. The app frameworks automatically set up and run the run loop on the main thread as part of the application startup process.
 
 The following sections provide more information about run loops and how you configure them for your application. For additional information about run loop objects, see NSRunLoop Class Reference and CFRunLoop Reference.
 
 https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Multithreading/RunLoopManagement/RunLoopManagement.html
 
 
 A run loop receives events from two different types of sources. Input sources deliver asynchronous events, usually messages from another thread or from a different application. Timer sources deliver synchronous events, occurring at a scheduled time or repeating interval. Both types of source use an application-specific handler routine to process the event when it arrives.
 
 
 
 
 
 Input sources deliver events asynchronously to your threads. The source of the event depends on the type of the input source, which is generally one of two categories. Port-based input sources monitor your application’s Mach ports. Custom input sources monitor custom sources of events. As far as your run loop is concerned, it should not matter whether an input source is port-based or custom. The system typically implements input sources of both types that you can use as is. The only difference between the two sources is how they are signaled. Port-based sources are signaled automatically by the kernel, and custom sources must be signaled manually from another thread
 */



class RunLoop_SWF {
    func test()  {
       
       
        
        //创建一个全局队列。
        //get a global queue
        let globalQueue = DispatchQueue.global()
        
        //使用全局队列，开启异步任务。
        //use the global queue , run in asynchronous
        globalQueue.async {
            print("I am No., current thread name is:\(Thread.current)")
            
        
            
            //MARK:RunLoopConfig2
            
            let runLoop = CFRunLoopGetCurrent()
            
            let firedate = CFAbsoluteTimeGetCurrent()
            
            let distantdate = NSDate.distantFuture
            
            // let doubledistant = CFDateGetTimeIntervalSinceDate(CFDateCreate(kCFAllocatorDefault, firedate), CFDateCreate(kCFAllocatorDefault, kCFAbsoluteTimeIntervalSince1904))
            
            /*
             以上这个基本设置为很遥远的时间
             */
            
            let doubledistant = 5.0
            
            var info = "maintimer"
            
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
            
            let timer  = CFRunLoopTimerCreate(kCFAllocatorDefault, firedate,doubledistant, 0, 0, { (timer:CFRunLoopTimer?, p:UnsafeMutableRawPointer?) -> Void in
                
                print("test global \(CFDateCreate(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent()))")
                
            } , timerContext)
            
            let repeatState = CFRunLoopTimerDoesRepeat(timer)
            
            if repeatState {
                
                print("定时器 永久定时任务")
                
            }
            
            CFRunLoopAddTimer(runLoop, timer,CFRunLoopMode.defaultMode )
            var loopCount = 10
            
            repeat {
                
                loopCount = loopCount - 1
                
                CFRunLoopRunInMode(CFRunLoopMode.defaultMode, 18, true)
                
                print("RunLoop global BackEnd 第\(loopCount)次")
                
                
            }while(loopCount > 0)
            
            
            
            
            
        }
        
        
    }
}
