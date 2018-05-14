//
//  NoteDAO.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import UIKit

class NoteDAO: NSObject {

    //保存数据列表
    
    private var listData = [Note]()
    
    //插入Note方法
    
    func create(model:Note) {
        
        listData.append(model)
        
    }
    
    //删除note方法
    
    func remove(model:Note) throws {
        
        guard let date = model.date else {
            //抛出"主键为空"错误
            
            throw DAOError.PrimaryKeyNull
            
        }
        
        //比较日期主键是否相等
        
        for (index,note) in listData.enumerated() where note.date == date {
            
            listData.remove(at: index)
        }
        
    }
    
    //修改note 方法
    
    func  modify(model:Note) throws {
        
        guard let date = model.date else {
            //抛出主键为空的错误
            throw DAOError.PrimaryKeyNull
        }
        
        //比较日期主键是否相等
        
        for note in listData where note.date == date {
            
            note.content = model.content
        }
        
    }
    
    // 查询所有数据方法
    //MARK: 这里跑出异常的方法
    func  findAll() throws -> [Note] {
        
        
        if listData.count == 0 {
            print("等于0")
        }
        
        guard listData.count > 0 else {
            
            print("不等于0")
            //抛出没有数据的错误
            throw DAOError.NoData
        }
        
        
        defer {
            print("类似 Java 的 try catch 异常处理机制 中finally代码块 无论成功执行 还是异常发生 程序保证会执行 finally代码的内容  程序员 需要在 finally 代码块中释放资源-3")
            
        }
        defer {
            print("关闭数据库2")
        }
        defer {
            print("执行顺序-注意defer的执行顺序1")
        }
         return listData
        
    }
    
    
    //修改Note 方法
    
    func  findById(model:Note) throws -> Note? {
        
        guard let date = model.date else {
            
            //抛出主键为空的错误
            
            throw DAOError.PrimaryKeyNull
            
        }
        
        //比较日期主键是否相等
        
        for note in listData where note.date == date {
            
            return note
            
        }
        
        return nil
        
    }
    
}
