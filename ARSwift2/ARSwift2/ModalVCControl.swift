//
//  ModalVCControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class ModalVCControl: UIViewController {

    let ballLayer = CALayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.view.backgroundColor = UIColor.brown
        
        let btnA:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnA.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:44,width:200,height:40)
        
        btnA.addTarget(self, action: #selector(ModalVCControl.doBack), for: UIControlEvents.touchUpInside)
        
        btnA.setTitle("返回上一页", for: UIControlState.normal)
        
        btnA.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btnA)
        
        
        let image = UIImage(named:"ball.jpg")
        
        self.ballLayer.contents = image?.cgImage
        self.ballLayer.bounds = CGRect(x:0.0,y:0.0,width:20,height:20)
        
       /*设置图层内容的渲染方式-以下模式是 是内容重新调整保持原样*/
        self.ballLayer.contentsGravity = kCAGravityResizeAspect
        /*
         position位置 设置为视图中心点坐标
         */
        
        self.ballLayer.position = CGPoint(x:self.view.bounds.midX,y:self.view.bounds.midY)
        
        self.view.layer.addSublayer(self.ballLayer)
        
        //MARK:飞机
        
        let btnB:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnB.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:124,width:200,height:40)
        
        btnB.addTarget(self, action: #selector(ModalVCControl.doExplicityAnimation(sender:)), for: UIControlEvents.touchUpInside)
        
        btnB.setTitleColor(UIColor.red, for: .normal)
        
        btnB.setTitle("显式动画进入", for: UIControlState.normal)
        
     
        
        self.view.addSubview(btnB)
        
        //MARK:视频控制器-1
        let btnC:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnC.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:184,width:200,height:40)
        
        btnC.addTarget(self, action: #selector(ModalVCControl.doMovie(sender:)), for: UIControlEvents.touchUpInside)
        
        btnC.setTitleColor(UIColor.red, for: .normal)
        
        btnC.setTitle("视频控制器", for: UIControlState.normal)
        
        
        
        self.view.addSubview(btnC)
        
        //MARK:摄像头录制
        
        
        let btnD:UIButton = UIButton.init(type: UIButtonType.custom)
        
    btnD.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:244,width:200,height:40)
        
        btnD.addTarget(self, action: #selector(ModalVCControl.doCamera(sender:)), for: UIControlEvents.touchUpInside)
        
        btnD.setTitleColor(UIColor.red, for: .normal)
        
        btnD.setTitle("摄像头控制器", for: UIControlState.normal)
        
        
        
        self.view.addSubview(btnD)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func doCamera(sender:AnyObject)  {
         //MARK:视频 - 录制  摄像头
        
        let camControl = CameraVCControl()
        
        self.present(camControl, animated: true) {
            
        }
        
        
        
    }
      //MARK:视频 play
    @objc func doMovie(sender:AnyObject)  {
        
          //MARK:视频控制器
        
        let moviControl = MovieVCControl()
        
        self.present(moviControl, animated: true) {
            
        }
        
    }
    
    @objc func doExplicityAnimation(sender:AnyObject)  {
        
        //MARK:显式动画进入
        
        let explicityControl = AnimationExpilicitControl()
        
        self.present(explicityControl, animated: true) {
            
        }
        
    }
    
    @objc func doBack()  {
        self.dismiss(animated: false) {
            
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
