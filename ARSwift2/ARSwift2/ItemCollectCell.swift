//
//  ItemCollectCellCollectionViewCell.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class ItemCollectCell: UICollectionViewCell {
    
    let imageV:UIImageView! = UIImageView()

    /*
      存储属性 没有设置 get set 方法
     
     存储属性 可以设置 lazy 懒加载
     
     计算属性 设置了 get 或 set 方法
     
     计算属性 有一个特点 必须采用 var 声明
     
     
     计算属性 可以有 只读计算属性 意思就是 没有了 set{}
     
     那么 在只读计算属性编写时 也可以省略 get{}
     
     的书写
     
     */
    
    override init(frame: CGRect) {
        
        
        
        imageV.frame = CGRect(x:0,y:0,width:100,height:100)
        
        imageV.backgroundColor = UIColor.red
        
        super.init(frame: frame)
        
        /*
          继承 初始化时 self 调用 必须在super 调用之后
         */
        //MARK:继承 初始化时 self 调用 必须在super 调用之后
        self.contentView.addSubview(imageV)
        
       
       self.backgroundColor = UIColor.gray
        self.contentView.backgroundColor = UIColor.yellow
        
        
        
    
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
