//
//  Bullet.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/29.
//  Copyright © 2017年 admindyn. All rights reserved.
//

import SpriteKit
import UIKit

class Bullet: SKSpriteNode {

    //速度
    
    var velocity:CGVector
    
     init(texture: SKTexture?, velocity:CGVector) {
        
        print("这里没有convenience 证明在当前类 是指定构造函数 因为在该方法中 调用了 父类的构造函数 证明是继承 那么指定构造函数 必须保证其所在类的所有存储属性都初始化完成")
        
        self.velocity = velocity
        
        super.init(texture: texture, color:UIColor.clear,size:texture!.size())
        print("指定构造函数 必须先向上调用完父类 然后再为继承的属性设置新值")
        print("以上初始化完成 Bullet Sprite")
        print("以下初始化完成后 修改存储属性  调用实例方法等处理")
        self.isHidden = true
        
        //设置子弹与物理引擎的关联
        
        let bulletBody = SKPhysicsBody(rectangleOf:self.size)
        
        self.physicsBody =  bulletBody
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
