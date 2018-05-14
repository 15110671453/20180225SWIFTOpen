//
//  PopVCControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class PopVCControl: UIViewController,UINavigationBarDelegate,UICollisionBehaviorDelegate,UIGestureRecognizerDelegate{

    let imagV:UIImageView = UIImageView()
    
    var animator:UIDynamicAnimator?
    
    var gravity:UIGravityBehavior?
    
    var collision:UICollisionBehavior?
    
    var collisionXiFU:UICollisionBehavior?
    
    var attach:UIAttachmentBehavior?
    
    let attachPointer:UIImageView = UIImageView()
    
    
    let img2:UIImageView = UIImageView()
    
    var firstContract = false
    
    var snap:UISnapBehavior? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        //控制导航控制器原本默认的行为 与样式 需要代理
    
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        
         self.view.backgroundColor = UIColor.yellow
        
        
        imagV.frame = CGRect(x:100,y:80,width:50,height:50)
        imagV.backgroundColor = UIColor.red
        
        imagV.clipsToBounds = true
        
        imagV.layer.cornerRadius = 25
        
        self.view.addSubview(imagV)
        
        
        img2.frame = CGRect(x:200,y:80,width:50,height:50)
        img2.backgroundColor = UIColor.green
        
       
        
        self.view.addSubview(img2)
        
        attachPointer.frame = CGRect(x:200,y:280,width:20,height:20)
        attachPointer.backgroundColor = UIColor.cyan
        
        //asdattachPointer.clipsToBounds = true
        attachPointer.layer.cornerRadius = 10
        self.view.addSubview(attachPointer)
        
        /*
         UIDynamicAnimator 与 referenceView
         1:1 一个动画力场 只能 1 个对象 一个视图 绑定
         */
        
        self.animator = UIDynamicAnimator.init(referenceView: self.view)
        /*一个力学行为可以绑定多个 视图*/
        //重力行为
        self.gravity = UIGravityBehavior.init(items: [self.img2,self.imagV])

        /*
          默认重力 是向下 1.0 大小
         
         设置一个重力矢量 如果y轴方向为负数 则物体会向上运动
         */
        let gravityDirection:CGVector = CGVector.init(dx: 0.0, dy: 0.1)
        
        self.gravity?.gravityDirection = gravityDirection
        
        self.animator?.addBehavior(self.gravity!)
        
        //碰撞行为
        
         self.collision = UICollisionBehavior.init(items: [self.imagV,self.img2])
        
       
        
        
        self.collision?.translatesReferenceBoundsIntoBoundary = true
               /*设置碰撞线 如果不设置 默认碰撞线是屏幕*/ self.collision?.addBoundary(withIdentifier: "col1" as NSCopying, from: CGPoint(x:0,y:500), to: CGPoint(x:380,y:300))
        
        //
        
        self.collisionXiFU = UICollisionBehavior.init(items: [self.img2])
        
        let width = self.img2.frame.size.width
        
        let origin = self.img2.frame.origin
        
        self.collisionXiFU?.addBoundary(withIdentifier: "barrier" as NSCopying, from: origin, to: CGPoint(x:origin.x+width,y:origin.y))
        
        self.collisionXiFU?.translatesReferenceBoundsIntoBoundary = true
        
        self.collisionXiFU?.collisionDelegate = self
       
       /*
         一个动画力场 可以添加 都个力学行为
         */
       
       self.animator?.addBehavior(self.collisionXiFU!)
       
        /*
         这个与前面的行为有不同 这里是行为限制描述某个视图的行为属性
         
         density 设置该视图 模拟的密度
         
         elasticity 设置 弹性系数
         
         friction  设置 摩擦系数
         
         resistance 设置 阻力
         
         allowsRotation 是否允许旋转
         
         angularResistance 角阻力 物体旋转时旋转方向的阻力
         
         
         */
        let itemBehaviour = UIDynamicItemBehavior(items:[self.img2])
        
        itemBehaviour.elasticity = 0.5
        
        itemBehaviour.allowsRotation = true
        
        itemBehaviour.friction = 0.0
        
        itemBehaviour.resistance = 0.0
        
        self.animator?.addBehavior(itemBehaviour)
        
        self.animator?.addBehavior(self.collision!)
        
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(PopVCControl.handleSnapToShuai(sender:)))
        
    self.view.addGestureRecognizer(gesture)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleSnapToShuai(sender:AnyObject)  {
        
        let ges = sender as! UITapGestureRecognizer
        
        let point = ges.location(in: self.view)
        
        //移除甩行为
        
        if self.snap != nil {
            self.animator?.removeBehavior(self.snap!)
        }
        
        self.snap = UISnapBehavior(item:self.img2,snapTo:point)
        
        self.animator?.addBehavior(self.snap!)
        
        
        
        
        
    }
    
    
    //MARK:碰撞检测 代理 为了 重力 落下过程 碰撞到某物体 吸附它
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint)
    {
        //设置吸附行为
        
      
        
        if !self.firstContract {
            
            self.firstContract = true
            /*
             给视图 添加吸附行为 两个视图相互牵制 牵引
             */
            self.attach = UIAttachmentBehavior(item:self.attachPointer,attachedTo:self.img2)
            
            self.animator?.addBehavior(self.attach!)
            /*
             这里 碰撞检测 后 给img2添加 推力行为
             
             该推力行为 有两种模式 瞬间 推力  和 持续推力  两种 模式
             
             
             */
            let push = UIPushBehavior(items:[self.img2], mode:UIPushBehaviorMode.instantaneous)
            /*
              设置推力行为的 方向 角度  负数代表向上
             这里-45度角 表示与x轴夹角
             
             magnitude  设置力的大小
             
             
             */
            push.setAngle(CGFloat(-M_PI/4.0), magnitude: 5.0)
            
            self.animator?.addBehavior(push)
        }
        
    }
    
    //MARK:NAVgationBarDelegate
    
    /*
     NavBarControl的根级controller 不受此代理影响
     */
    
    func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
        
        print("NavBarControl的根级controller 不受此代理影响-shouldpush ")
        return true
    }
    
    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        
        print("NavBarControl的根级controller 不受此代理影响-shouldpop ")
        return true
    }
    
    func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
        
    }
    
    func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {
        
    }
    //MARK:NAVControlDelegate
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        //MARK:自定义转场动画
        switch operation {
        case .pop:
            
            print("执行pop动画")
            
            return nil
            
        case .push:
            
            print("执行push动画")
            
            return nil
            
            
        default:
            
            print("不知道什么情况")
            
            return nil
            
        }
        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
