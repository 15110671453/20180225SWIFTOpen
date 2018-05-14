//
//  QueueManager.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/10.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation
import Dispatch

class QueueManager{
    
    var inactiveQueue:DispatchQueue? = nil
    /*
     serial`(串行)vs`concurrent`（并行）：`serial`将会执行完一个任务才会开始下一个，`concurrent`触发完一个就立即进入下一个，而不管它是否已完成。
     */
    /*
     OC中 队列的内存管理
     dispatch_queue_t myConcurrentQ = dispatch_queue_create("com.queue.test",DISPATCH_QUEUE_CONCURRENT);
     
     dispatch_async(myConcurrentQ,^{
        NSLog(@"block on my concurrent queue")
     });
     
     dispatch_release(myConcurrentQ);
     
     
     */
    /*
     以上代码 分发队列没有问题 内存处理
     
     第一 在dispatch_aysnc追加Block到队列dispatch queue 时 Block 通过 dispatch_retain 函数 持有了Dispatch Queue 无论串行队列还是并行队列 而在 Block 持有队列后 我们减少 队列引用计数 当Block 执行完之后 block 会内部再次 release  因此 将队列释放 没有任何内存泄漏
     */
    
    //MARK:串行队列--同步触发
    func simpleSerialQueues() {
        
        
        let queue = DispatchQueue(label:"com.sync.task01")
        
        let queue2 = DispatchQueue(label:"com.sync.task02")
         print("OC中串行队列 每生成一个队列 就是生成一个线程 可以追加到该队列 执行任务 但是 一旦 生成多个串行队列实例 就是多个线程  但是Swift 串行队列好像不是 但仔细一想 好像和队列本身实例没什么关系 而和队列触发的方式 我们这里是同步触发 如果是异步触发呢 ")
        //同步队列执行
        
        queue.sync {
            for i in 0..<10 {
                print("同步触发 串行队列执行任务1--\(i)")
               
            }
        }
        
        //同步队列执行
        
        queue2.sync {
            for k in 0..<10 {
                print("同步触发 串行队列执行任务2--\(k)")
            }
        }
        
        //同步主线程 队列执行
        
        
            for m in 0..<10 {
                print("同步主线程 队列执行--\(m)")
            }
        
    
    }
    
    //MARK:串行队列--异步触发
    
    func simpleAsyncSerialQueues() {
        //MARK:异步队列不会阻塞当前线程 而是会另开一个线程来执行当前的任务，而主线程上的任务也就不会被阻塞
        let queue = DispatchQueue(label:"com.sync.task1")
        
        let queue2 = DispatchQueue(label:"com.sync.task2")
        
         print("OC中串行队列 每生成一个队列 就是生成一个线程 可以追加到该队列 执行任务 但是 一旦 生成多个串行队列实例 就是多个线程  但是Swift 串行队列好像不是 但仔细一想 好像和队列本身实例没什么关系 而和队列触发的方式 我们这里是同步触发 如果是异步触发呢 ")
        
        print("实证 证明 每个队列标识不一样 生成一个队列实例 就是会开辟一个线程 如果是串行队列 同步触发 任务都是依次执行 如果是两个不同标识的串行队列 异步触发 任务执行的顺序就不一样 ")
        
        //同步队列执行
        
        queue.async {
            for i in 0..<10 {
                print("queue1 - 1异步触发 串行队列执行任务1--\(i)")
            }
        }
        
        queue.async {
            for i in 0..<10 {
                print("queue1 - 2异步触发 串行队列执行任务1--\(i)")
            }
        }
        
        queue2.async {
            for i in 0..<10 {
                print("queue2 - 1异步触发 串行队列执行任务+++2--\(i)")
            }
        }
        
        //同步主线程 队列执行
        
        for j in 0..<10 {
            
                print("同步主线程 队列执行--\(j)")
            
        }
        
    }
    
    
    func qosFalseConcurrentQueues() {
        //MARK:让异步队列 没有并行 还在串行
        let queue = DispatchQueue(label:"com.async.false",qos:DispatchQoS.unspecified)
        
        queue.async {
            for i in 0..<10 {
                
                print("queue-- 一个队列同等优先级 输出 \(i)")
            }
        }
        
        queue.async {
            for k in 10..<20 {
                
                print("queue-- 一个队列同等优先级 输出 默认队列async调用还是串行 \(k)")
            }
        }
        
        
        for m in 30..<40 {
            print("主线程 \(m)")
        }
        
    }
    
    //MARK:让异步队列
    func qosConcurrentQueues() {
        //MARK:让异步队列 并行默认队列是串行 需要实例化时多设置一个属性参数
        let queue = DispatchQueue(label:"com.async.tasks",qos:DispatchQoS.unspecified,attributes:.concurrent)
        
        queue.async {
            for i in 0..<10 {
                
                print("queque-1 -- 一个队列 同等优先级 分两次 追加两个任务1 输出 \(i)")
            }
        }
        
        queue.async {
            for k in 10..<20 {
                
                print("queue-2-- 一个队列 分两次 追加两个任务 同等优先级 输出 async异步触发调用 任务2  \(k)")
            }
        }
        
        
        for m in 30..<80 {
            print("并行队列主线程 \(m)")
        }
        
    }
    
    func qosConcurrentQueueDif() {
        let que1  = DispatchQueue(label:"com.async.taskQ1",qos:DispatchQoS.userInteractive)
        let que2 = DispatchQueue(label:"com.async.taskQ2",qos:DispatchQoS.utility)
        
        que1.async {
            for i in 0..<10 {
                print("que1一步队列执行\(i)")
            }
        }
        
        que2.async {
            for k in 0..<10 {
                print("que2一步队列执行\(k)")
            }
        }
        
        //主线程
        for j in 0..<10 {
            print("主线程执行\(j)")
        }
    }
    
    func qosInitiallyQueue()  {
        let que  = DispatchQueue(label:"com.async.ndInitialy",qos:DispatchQoS.utility,attributes:.initiallyInactive)
        inactiveQueue=que
        que.async {
            for i in 0..<10 {
                print("不活跃 不立刻触发 需要程序员自己触发 队列开始执行\(i)")
            }
        }
        
        que.async {
            for k in 0..<10 {
                print("不活跃 不立刻触发 需要程序员自己触发 队列开始执行\(k)")
            }
        }
    }
    
    func delayQueue()  {
        let delayQueue = DispatchQueue(label:"com.async.nddelay",qos:.userInteractive)
        
        let delayTime : DispatchTimeInterval = .seconds(5)
        
        print("队列准备完毕前\(Date())")
        
        delayQueue.asyncAfter(deadline: .now() + delayTime) {
            for k in 30..<40 {
                
                print("延迟执行\(k)")
                
            }
        }
        
        print("延迟执行 准备完毕后")
        
        for m in 70..<120 {
            print("延迟队列back主线程\(m)")
        }
    }
    
    
    
    
    
}

