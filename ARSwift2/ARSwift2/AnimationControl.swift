//
//  AnimationControlViewController.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class AnimationControl: UIViewController,UINavigationControllerDelegate,UIViewControllerTransitioningDelegate {

   
    let fileManager:AppPathManager = AppPathManager()
    
    let iv:UIImageView = UIImageView()
    
    let label:UILabel  = UILabel()
    
    let imageProcess:CICGImageView = CICGImageView()
    
    let slid:UISlider = UISlider()
    
    var flag = 0
    
    var flagAni = 1
    
    var value:Float = 0
    
    let btn5:UIButton = UIButton.init(type: UIButtonType.custom)
    //MARK:存取属性 ViewController的 继承隐藏状态栏
    
    /*
     没有在 navcontrol 中 写 而是写在它的 root 中 才有效果 才能隐藏状态栏
     */
    override var prefersStatusBarHidden: Bool {
        
        get {
            return true
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    self.view.backgroundColor = UIColor.cyan
        
        
        
        
        //MARK:准备转场自定义动画 需要添加代理
       
        
        
        //控制导航控制器原本默认的行为 与样式 需要代理
        //self.navigationController?.navigationBar.delegate = self
        
        // Do any additional setup after loading the view.
        
        let btnA:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnA.frame=CGRect(x:120,y:44,width:200,height:40)
        
        btnA.addTarget(self, action: #selector(AnimationControl.doBack), for: UIControlEvents.touchUpInside)
        
        btnA.setTitle("返回上一页", for: UIControlState.normal)
        
        btnA.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btnA)
        
        let btn:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btn.frame=CGRect(x:120,y:94,width:200,height:40)
        
        btn.addTarget(self, action: #selector(AnimationControl.doResource(btn:)), for: UIControlEvents.touchUpInside)
        
        btn.setTitle("资源目录加载", for: UIControlState.normal)
        
        btn.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn)
        
        
        let btn2:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btn2.frame=CGRect(x:120,y:154,width:200,height:40)
        
        btn2.addTarget(self, action: #selector(AnimationControl.doSandBox(btn:)), for: UIControlEvents.touchUpInside)
        
        btn2.setTitle("沙箱目录加载", for: UIControlState.normal)
        
        btn2.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn2)
        
        
        let btn3:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btn3.frame=CGRect(x:10,y:204,width:400,height:40)
        
        btn3.addTarget(self, action: #selector(AnimationControl.doTrasform(btn:)), for: UIControlEvents.touchUpInside)
        
        btn3.setTitle("资源目录->沙箱目录", for: UIControlState.normal)
        
        btn3.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn3)
        
        
        
        iv.backgroundColor = UIColor.red
        iv.frame = CGRect(x:10, y:74, width:100, height:100)
        
        self.view.addSubview(iv)
        
        label.frame = CGRect(x:10, y:274, width:UIScreen.main.bounds.width-20, height:100)
        
        label.backgroundColor = UIColor.yellow
        label.text = "information"
        
    self.view.addSubview(label)
        
        
        slid.addTarget(self, action: #selector(AnimationControl.changeValue(sender:)), for: .valueChanged)
        
        slid.frame = CGRect(x:10, y:384, width:UIScreen.main.bounds.width-20, height:40)
        
        slid.backgroundColor = UIColor.cyan
        
        self.view.addSubview(slid)
        
        let btn4:UIButton = UIButton.init(type: UIButtonType.custom)
        
    btn4.frame=CGRect(x:UIScreen.main.bounds.width/2-400/2,y:434,width:400,height:40)
        
        btn4.addTarget(self, action: #selector(AnimationControl.doZhuanChangAnimation(sender:)), for: UIControlEvents.touchUpInside)
        
        btn4.setTitle("进入导航转场动画", for: UIControlState.normal)
        
        btn4.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn4)
        
        
        
        
        btn5.frame=CGRect(x:UIScreen.main.bounds.width/2-400/2,y:484,width:400,height:40)
        
        btn5.addTarget(self, action: #selector(AnimationControl.downAnimation(sender:)), for: UIControlEvents.touchUpInside)
        
        btn5.setTitle("downAnimation", for: UIControlState.normal)
        
        btn5.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn5)
        
        let btn6:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btn6.frame=CGRect(x:UIScreen.main.bounds.width/2-400/2,y:534,width:400,height:40)
        
        btn6.addTarget(self, action: #selector(AnimationControl.doTranViewAnimation), for: UIControlEvents.touchUpInside)
        
        btn6.setTitle("transViewAnima", for: UIControlState.normal)
        
        btn6.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn6)
        
        let btn7:UIButton = UIButton.init(type: UIButtonType.custom)
        
    btn7.frame=CGRect(x:UIScreen.main.bounds.width/2-400/2,y:584,width:400,height:40)
        
        btn7.addTarget(self, action: #selector(AnimationControl.doPresentAnimation(sender:)), for: UIControlEvents.touchUpInside)
        
        btn7.setTitle("进入模态动画", for: UIControlState.normal)
        
        btn7.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn7)
        
        
    }
    
    @objc func downAnimation(sender:UIButton) {
        
        //MARK:Down
        UIView.animate(withDuration: 1.5, animations: { [weak self] in
            self?.btn5.alpha = 0.0
            
            var frame = self?.iv.frame
            
            frame?.origin.y += CGFloat(100*(self?.flagAni)!)
            
            self?.flagAni *= -1 //取反
            
            self?.iv.frame = frame!
        }) { [weak self] (finished) in
            //MARK:动画有结束监听回调
            print("动画结束了")
            
            self?.viewAnimationDone()
            
        }
    }
    
    //MARK:页面动画
    @objc func doTranViewAnimation() {
        
       
        
        self.iv.alpha = 0
        
        UIView.transition(with: self.iv, duration: 3.0, options:[.curveEaseOut,.transitionCurlDown], animations: {
            self.iv.alpha = 1.0
            print("动画开始")
            
        }) { (finished) in
            
            print("动画结束")
            
        }
        
        
    }
    
    func viewAnimationDone() {
        //MARK:动画没有结束监听回调
        UIView.animate(withDuration: 1.0) { [weak self] in
            
            self?.btn5.alpha = 1.0
        }
    }
    
    //MARK:自定义模态转场动画
    @objc func doPresentAnimation(sender:UIButton) {
        
        let presentVC:ModalVCControl = ModalVCControl()
        
        self.present(presentVC, animated: false) {
            
        }
        
        
    }
    
    //MARK:返回执行
    
    @objc func doBack()  {
        self.dismiss(animated: true) {
            
        }
    }
    
    //MARK:导航控制转场动画
    @objc func doZhuanChangAnimation(sender:UIButton) {
        
        let  popControl:PopVCControl = PopVCControl()
        
  self.navigationController?.pushViewController(popControl, animated: false)
        
    }
    
    @objc func changeValue(sender:AnyObject)  {
        
        let slider = sender as! UISlider
        
        self.value = slider.value
        
        if self.flag == 0 {
            
            doFilterJiuSeDiao()
            
        } else {
            
            doFilterGaussianBlur()
        }
        
        
    }
    
    func doFilterGaussianBlur()  {
        
        if let image = iv.image {
            self.label.text = "改变前GuassianBlur"
            imageProcess.filterGaussianBlur(value: self.value, imageCG: image.cgImage!, width: 100, height: 100, completion: {
                
                [weak self] (imag, info) in
                
                
                self?.label.text = info
                
                self?.iv.image = UIImage.init(cgImage: imag!)
            })
            
        }
    }
    
    func doFilterJiuSeDiao()  {
        
        if let image = iv.image {
            
            self.label.text = "改变前"
            imageProcess.filterSepiaTone(value: self.value, imageCG: image.cgImage!, width: 100, height: 100, completion: {
                [weak self] (imag, info) in
                self?.label.text = info
                self?.iv.image = UIImage.init(cgImage: imag!)
            })
            
            
        }
        
    }
    
    @objc func doSandBox(btn:UIButton)  {
        self.flag = 1
        fileManager.loadSandBox(fileNameS: "meinv.jpg") {[weak self] (image) in
            self?.iv.image = image
        }
        
    }
    
    @objc func doResource(btn:UIButton) {
        self.flag = 0
        fileManager.loadBundle(fileNameS: "rainbow.jpg") { [weak self] (image) in
            self?.iv.image = image
        }
    }
    
    @objc func doTrasform(btn:UIButton)  {
        self.flag = 1
        
        fileManager.createdEditableCopyOfDataBaseIfNeeded(fileNameS: "meinv.jpg") { [weak self] (image) in
            
            self?.iv.image = image
        }
        
    }
  
   
    //MARK:ViewTransitionDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let  ani = SlideAnimator()
        
        return ani
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let  ani = SlideAnimator()
        
        return ani
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
