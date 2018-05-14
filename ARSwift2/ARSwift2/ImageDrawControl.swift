//
//  ImageAnimationControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class ImageDrawControl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        
        print("触发视图 重绘 几种情况:当遮挡你的视图移除或者移动时；当视图又hiden属性true 变false时；将视图滚出屏幕 又进入屏幕时；显示调用setNeedsDisplay或 setNeedsDisplsayInRect")

        
        let v:CutomViewImage = CutomViewImage()
        
    v.backgroundColor=UIColor.yellow
        
        v.frame=CGRect(x:0,y:0,width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height)
        
        let v2:CustomViewImageContext = CustomViewImageContext()
        
        
        v2.frame = CGRect(x:UIScreen.main.bounds.width-160-10,y:20,width:160,height:500)
        
        v2.backgroundColor = UIColor.gray
        
        v.addSubview(v2)
        
        self.view.addSubview(v)
        
        let btnA:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnA.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:540,width:200,height:40)
        
        btnA.addTarget(self, action: #selector(ImageDrawControl.doBack), for: UIControlEvents.touchUpInside)
        
        btnA.setTitle("返回上一页", for: UIControlState.normal)
        
        btnA.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btnA)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func doBack()  {
        self.dismiss(animated: true) {
            
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
