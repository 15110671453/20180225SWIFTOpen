//
//  AnimationExpilicitControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class AnimationExpilicitControl: UIViewController,CAAnimationDelegate {

    let imagv:UIImageView = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.white
        
        print("之前都是使用隐式动画 隐式动画  不用设置定时器  不用考虑线程或者重画 它的属性都是默认 我们前面AnimationControl 等 控制器 写的 都是隐式动画ImplicitAnimation")
        
        let im:UIImage = UIImage(named:"feiji.jpg")!
        
        imagv.image = im
        
        imagv.frame = CGRect(x:0,y:64,width:100,height:100)
        
        //设置图层透明度0.25
        
        imagv.layer.opacity = 0.25
        
        self.view.addSubview(self.imagv)
        
        let btnA:UIButton = UIButton.init(type: .custom)
        
        btnA.frame = CGRect(x:10,y:280,width:200,height:40)
        
        btnA.setTitle("返回上一页", for: .normal)
        
        btnA.addTarget(self, action: #selector(AnimationExpilicitControl.doBack), for: .touchUpInside)
        btnA.setTitleColor(UIColor.red, for: .normal)
        
        self.view.addSubview(btnA)
        
        
        print("先回顾 隐式动画")
        
        let btn:UIButton = UIButton.init(type: .custom)
        
        btn.frame = CGRect(x:10,y:344,width:200,height:40)
        
        btn.setTitle("隐式动画起飞", for: .normal)
        
        btn.addTarget(self, action: #selector(AnimationExpilicitControl.movePlaneYinShi(sender:)), for: .touchUpInside)
        btn.setTitleColor(UIColor.red, for: .normal)
        
    self.view.addSubview(btn)
        
        
        
        print("设置 显式动画")
        
        
        let btn2:UIButton = UIButton.init(type: .custom)
        
        btn2.frame = CGRect(x:10,y:444,width:200,height:40)
         btn2.addTarget(self, action: #selector(AnimationExpilicitControl.movePlaneXianShi(sender:)), for: .touchUpInside)
        btn2.setTitle("显式动画起飞", for: .normal)
        
    btn2.setTitleColor(UIColor.red, for: .normal)
        
        self.view.addSubview(btn2)
        
        
        let btn3:UIButton = UIButton.init(type: .custom)
        
        btn3.frame = CGRect(x:10,y:494,width:200,height:40)
        btn3.addTarget(self, action: #selector(AnimationExpilicitControl.movePlaneKeyFrame(sender:)), for: .touchUpInside)
        btn3.setTitle("显式动画起飞-关键帧", for: .normal)
        
        btn3.setTitleColor(UIColor.red, for: .normal)
        
        self.view.addSubview(btn3)
        
        
        let btn4:UIButton = UIButton.init(type: .custom)
        
        btn4.frame = CGRect(x:10,y:544,width:200,height:40)
        btn4.addTarget(self, action: #selector(AnimationExpilicitControl.movePlaneWuJiaoXingPath(sender:)), for: .touchUpInside)
        btn4.setTitle("显式动画起飞-五角星", for: .normal)
        
        btn4.setTitleColor(UIColor.red, for: .normal)
        
        self.view.addSubview(btn4)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func doBack()  {
        self.dismiss(animated: true) {
            
        }
    }

    @objc func movePlaneXianShi(sender:AnyObject)  {
        
        
        let opAnim = CABasicAnimation.init(keyPath: "opacity")
        
        /*
         指定动画持续时间
         */
        opAnim.duration = 3.0
        
        /*
         指定开始时 透明度值
         */
        
        opAnim.fromValue = 0.25
        
        /*
         指定结束时 透明度值
         */
        opAnim.toValue = 1.0
        
        /*
         指定累计上次值
         */
        opAnim.isCumulative = true
        
        opAnim.repeatCount = 2
        
        /*
         设置动画结束时的处理方式
         
         设置保持动画结束值
         
         防止闪回问题 动画完成之后 飞机透明度应该是1.0 闪一下变回初始化的0.25
         */
        
        opAnim.fillMode = kCAFillModeForwards
        
        /*
         设置 动画结束时 不停止
         
         这样设置前面的fillmode 才能起作用
         */
        
    opAnim.isRemovedOnCompletion = false
        
        self.imagv.layer.add(opAnim, forKey: "animationOpacity")
        
        
        let moveTransform = CGAffineTransform.init(translationX: 180, y: 200)
        
        let moveAnim = CABasicAnimation.init(keyPath: "transform")
        
        moveAnim.duration = 6.0
        
        /*
         toValue 设置结束值  接受一个仿射变换矩阵 但是要 是NAValue 类型的数据
         */
        
        moveAnim.toValue = NSValue.init(caTransform3D: CATransform3DMakeAffineTransform(moveTransform))
        
        moveAnim.fillMode = kCAFillModeForwards
        
        moveAnim.isRemovedOnCompletion = false
        
        
        self.imagv.layer.add(moveAnim, forKey: "animateTransform")
        
        
        
        
        
        
    }
    
    
    @objc func movePlaneKeyFrame(sender:AnyObject)  {
        
        
        
        let opAnim = CAKeyframeAnimation.init(keyPath: "opacity")
        
        /*
         指定动画持续时间
         */
        opAnim.duration = 3.0
        
        /*
         指定 透明度值序列
         */
        
        opAnim.values = [0.25,0.75,1.0]
        
        /*
         指定动画时间  序列
         */
        opAnim.keyTimes = [0.0,0.5,1.0]
        
        /*
         指定累计上次值
         */
        opAnim.isCumulative = true
        
        opAnim.repeatCount = 2
        
        /*
         设置动画结束时的处理方式
         
         设置保持动画结束值
         
         防止闪回问题 动画完成之后 飞机透明度应该是1.0 闪一下变回初始化的0.25
         */
        
        opAnim.fillMode = kCAFillModeForwards
        
        /*
         设置 动画结束时 不停止
         
         这样设置前面的fillmode 才能起作用
         */
        
        opAnim.isRemovedOnCompletion = false
        
        self.imagv.layer.add(opAnim, forKey: "animationOpacity")
        
        
        let moveTransform = CGAffineTransform.init(translationX: 180, y: 200)
        
        let moveAnim = CABasicAnimation.init(keyPath: "transform")
        
        moveAnim.duration = 6.0
        
        /*
         toValue 设置结束值  接受一个仿射变换矩阵 但是要 是NAValue 类型的数据
         */
        
        moveAnim.toValue = NSValue.init(caTransform3D: CATransform3DMakeAffineTransform(moveTransform))
        
        moveAnim.fillMode = kCAFillModeForwards
        
        moveAnim.isRemovedOnCompletion = false
        
        
        self.imagv.layer.add(moveAnim, forKey: "animateTransform")
        
    }
    
    @objc func movePlaneWuJiaoXingPath(sender:AnyObject)  {
        
        self.imagv.layer.opacity = 1.0
        
        let starPath = CGMutablePath()
        
        starPath.move(to: CGPoint(x:160,y:100))
      
        starPath.addLine(to: CGPoint(x:100,y:280))
        
        starPath.addLine(to: CGPoint(x:260,y:170))
        
        starPath.addLine(to: CGPoint(x:60,y:170))
        
        starPath.addLine(to: CGPoint(x:220,y:280))
    
        starPath.closeSubpath()
        
        let ani = CAKeyframeAnimation.init(keyPath: "position")
        
        
        ani.duration = 10.0
        
        ani.path = starPath
        
        ani.delegate = self
        
        self.imagv.layer.add(ani, forKey: "positionAni")
        
        
    }
    
    @objc func movePlaneYinShi(sender:AnyObject)  {
        
        
        let moveTransform = CGAffineTransform.init(translationX: 180, y: 200)
        
        self.imagv.layer.setAffineTransform(moveTransform)
        
        self.imagv.layer.opacity = 1
        
        
    }
    
    //MARK:CAAnimationDelegate
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        UIView.animate(withDuration: 1.0) {
            self.imagv.layer.opacity = 1.0
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
