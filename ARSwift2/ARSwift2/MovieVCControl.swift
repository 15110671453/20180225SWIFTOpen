//
//  MovieVCControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class MovieVCControl: UIViewController {

    
    var moviePlayerView:MPMoviePlayerViewController? = nil
    
    var moviePlayer:MPMoviePlayerController? = nil
    
    let contentV:UIView = UIView()
    
    
    
    var avPlayer:AVPlayer? = nil
    
    var layer:AVPlayerLayer? = nil
    
    var playerItem:AVPlayerItem? = nil
    
    
    var toolBar:UIToolbar? = nil
    
    var slider:UISlider? = nil
    
    var isPlaying = false
    
    var timeObserver:AnyObject!
    
    
    
    
    
    
    
    
    
    
    
    
    /*
     以上两个 在9.0 已经 提示 不支持
     
     */
    
//    let avPlayControl:AVPlayerViewController = AVPlayerViewController()
    
    
    func movieURL() -> NSURL {
        
        let bundle = Bundle.main
        
        let moviPath = bundle.path(forResource: "test", ofType: "mp4")
        
        let url = NSURL.init(fileURLWithPath: moviPath!)
        
        return url
        
        
        
    }
    
    @objc func doBack()  {
        self.dismiss(animated: true) {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.contentV.backgroundColor = UIColor.cyan
        
        self.contentV.frame = CGRect(x:UIScreen.main.bounds.width/2-200/2,y:64,width:200,height:200)
        
        self.view.addSubview(self.contentV)
        
        let btn1:UIButton = UIButton.init(type: UIButtonType.custom)
        
    btn1.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:264,width:200,height:40)
        
        btn1.addTarget(self, action: #selector(MovieVCControl.doBack), for: UIControlEvents.touchUpInside)
        
        btn1.setTitleColor(UIColor.red, for: .normal)
        
        btn1.setTitle("返回上一页", for: UIControlState.normal)
        
        
        
        
        self.view.addSubview(btn1)
        
        
        
        let btnC:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnC.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:314,width:200,height:40)
        
        btnC.addTarget(self, action: #selector(MovieVCControl.useMPMovieControl(sender:)), for: UIControlEvents.touchUpInside)
        
        btnC.setTitleColor(UIColor.red, for: .normal)
        
        btnC.setTitle("MPController", for: UIControlState.normal)
        
        
        
        
        self.view.addSubview(btnC)
        
        
        
        let btnA:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnA.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:364,width:200,height:40)
        
        btnA.addTarget(self, action: #selector(MovieVCControl.useMovieViewControl(sender:)), for: UIControlEvents.touchUpInside)
        
        btnA.setTitleColor(UIColor.red, for: .normal)
        
        btnA.setTitle("MPViewController", for: UIControlState.normal)
        
        
        
        self.view.addSubview(btnA)
        
        
        let btnB:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnB.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:414,width:200,height:40)
        
        btnB.addTarget(self, action: #selector(MovieVCControl.useAVPlayer(sender:)), for: UIControlEvents.touchUpInside)
        
        btnB.setTitleColor(UIColor.red, for: .normal)
        
        btnB.setTitle("AVPlayer", for: UIControlState.normal)
        
        
        
        self.view.addSubview(btnB)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func useAVPlayer(sender:AnyObject)  {
        
        
        let asset = AVURLAsset.init(url: self.movieURL() as URL, options: nil)
        
        
        self.playerItem = AVPlayerItem.init(asset: asset)
        
        self.avPlayer = AVPlayer.init(playerItem: self.playerItem)
        
        self.layer = AVPlayerLayer.init(player: self.avPlayer)
        
        self.layer?.frame = CGRect(x:UIScreen.main.bounds.width/2-200/2,y:64,width:200,height:200)
        
       /*
         这里需要 注意 at 默认是 0 即可
         
         我们这里用1 因为 在指定的位置 已经有 蓝底的 view 层了  它在 0 层
         */
        self.view.layer.insertSublayer(self.layer!, at: 1)
        
        
        let duration = CMTimeGetSeconds(asset.duration)
        
        self.slider = UISlider()
        
        slider?.frame = CGRect(x:10,y:480,width:UIScreen.main.bounds.width-20,height:20)
        
        slider?.maximumValue = Float(duration)
        
        slider?.minimumValue = 0.0
        
        self.view.addSubview(slider!)
        
        //根据视图宽度 重新调整滑块的宽度
        
        self.slider?.frame = CGRect(x:(slider?.frame.origin.x)!,y:(slider?.frame.origin.y)!,width:self.view.frame.width-50,height:(self.slider?.frame.height)!)
        
        self.toolBar = UIToolbar()
        
        toolBar?.frame = CGRect(x:10,y:520,width:UIScreen.main.bounds.width-20,height:40)
        
        let item1 = UIBarButtonItem(barButtonSystemItem:.play,target:self,action:#selector(MovieVCControl.playAvPlayer(sender:)))
        
       let item2 = UIBarButtonItem(barButtonSystemItem:.action,target:self,action:#selector(MovieVCControl.seek(sender:)))
        
        toolBar?.items=[item1,item2]
        
        self.view.addSubview(toolBar!)
        
        
            let b:UIButton =
            sender as! UIButton
            
            b.alpha = 0.0
        
        
        
    }
    
    
    @objc func playAvPlayer(sender:AnyObject) {
        
        var item1:UIBarButtonItem!
        
        
        if !self.isPlaying {
            self.adObserver()
            
            self.avPlayer?.play()
            
            self.isPlaying = true
            
            item1 = UIBarButtonItem(barButtonSystemItem:.pause,target:self,action:#selector(MovieVCControl.playAvPlayer(sender:)))
            
        } else {
            
            self.isPlaying = false
            
            item1 = UIBarButtonItem(barButtonSystemItem:.play,target:self,action:#selector(MovieVCControl.playAvPlayer(sender:)))
            
            self.avPlayer?.pause()
            
        }
        
        
        let items = NSMutableArray(array:(self.toolBar?.items)!)
        
        items.replaceObject(at: 0, with: item1)
        
        self.toolBar?.items = items as? [UIBarButtonItem]
        
        
        
        
        
        
    }
    
    @objc func seek(sender:AnyObject) {
        
        let value = slider?.value
        
        /*
         CMTimeMakeWithSeconds(Float64(value!), 10)
         
         把秒转换为CMTime 时间
         
         第一个参数是一个时间值  第二个参数是时标  证明这里的时间单位是十分之一秒
         */
        
        self.avPlayer?.seek(to: CMTimeMakeWithSeconds(Float64(value!), 10))
        
        
    }
    
    func adObserver()  {
        
        if self.timeObserver == nil {
            
            NotificationCenter.default.addObserver(self, selector: #selector(MovieVCControl.playerItemDidReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.playerItem)
            
            /*
             CMTimeMake(1, 10)
             
             第一个参数是一个时间值  第二个参数是时标  证明这里的时间单位是十分之一秒
             */
            
            /*
             以下 第一个参数是 设置定时器触发的 时间周期
             
             
             
             
             */
            self.timeObserver = self.avPlayer?.addPeriodicTimeObserver(forInterval: CMTimeMake(1, 10), queue: DispatchQueue.main, using: { (time) in
                
                let duration = CMTimeGetSeconds((self.avPlayer?.currentTime())!)
                
                print("duration = %f",duration)
                
                
                self.slider?.value = Float(duration)
                
            }) as AnyObject
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    @objc func playerItemDidReachEnd(notification:NSNotification)  {
        print("AvPlayer 播放完成")
        
        if self.timeObserver != nil {
            self.avPlayer?.removeTimeObserver(self.timeObserver)
            
           
            self.timeObserver = nil
            
            self.slider?.value = 0.0
            
            self.isPlaying = false
            
           self.playerItem?.seek(to: CMTimeMakeWithSeconds(Float64(0.0), 10))
           self.avPlayer?.rate = 0.0
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
            
            let  item1 = UIBarButtonItem(barButtonSystemItem:.play,target:self,action:#selector(MovieVCControl.playAvPlayer(sender:)))
            
            let items = NSMutableArray(array:(self.toolBar?.items)!)
            
            items.replaceObject(at: 0, with: item1)
            
            self.toolBar?.items = items as? [UIBarButtonItem]
        }
        
        
        
        
    }
    
    @objc func useMovieViewControl(sender:AnyObject)  {
        
        if self.moviePlayerView == nil {
            
            
            self.moviePlayerView = MPMoviePlayerViewController.init(contentURL: self.movieURL() as URL!)

            
            self.moviePlayerView?.moviePlayer.scalingMode = .aspectFill
            
            self.moviePlayerView?.moviePlayer.controlStyle = .embedded
            
            NotificationCenter.default.addObserver(self, selector: #selector(MovieVCControl.playbackFinishedMoviePlayerViewController(notification:)), name: NSNotification.Name.MPMoviePlayerPlaybackDidFinish, object: nil)
        }
        
        
        self.presentMoviePlayerViewControllerAnimated(self.moviePlayerView)
        
    }
    
    
    @objc func useMPMovieControl(sender:AnyObject)  {
        
        if self.moviePlayer == nil {
            self.moviePlayer = MPMoviePlayerController.init(contentURL: self.movieURL() as URL!)
            
        self.moviePlayer?.scalingMode = MPMovieScalingMode.aspectFit
            
        self.moviePlayer?.controlStyle = MPMovieControlStyle.fullscreen
            
            self.contentV.addSubview((self.moviePlayer?.view)!)
            
            
            NotificationCenter.default.addObserver(self, selector: #selector(MovieVCControl.playbackFinishedMoviePlayerController(notification:)), name: NSNotification.Name.MPMoviePlayerPlaybackDidFinish, object: nil)
            
            NotificationCenter.default.addObserver(self, selector:#selector(MovieVCControl.doneButtonClick(notification:)), name: NSNotification.Name.MPMoviePlayerWillExitFullscreen, object: nil)
            
        }
        
        self.moviePlayer?.play()
        
    self.moviePlayer?.setFullscreen(true, animated: true)
    }
    
    @objc func playbackFinishedMoviePlayerViewController(notification:NSNotification)
    {
        print("使用MoviePlayerViewController播放完成")
        
        NotificationCenter.default.removeObserver(self)
        
        self.moviePlayerView?.dismissMoviePlayerViewControllerAnimated()
        
        self.moviePlayerView = nil
        
    }
    
    @objc func playbackFinishedMoviePlayerController(notification:NSNotification)  {
        print("使用MPMoviePlayerController播放")
        
        NotificationCenter.default.removeObserver(self)
        
        self.moviePlayer?.stop()
        
    self.moviePlayer?.view.removeFromSuperview()
        
        self.moviePlayer = nil
        
    }
    
    @objc func doneButtonClick(notification:NSNotification)  {
        
        print("退出全屏")
        
        if self.moviePlayer?.playbackState == MPMoviePlaybackState.stopped {
            
            
        self.moviePlayer?.view.removeFromSuperview()
            
            self.moviePlayer = nil
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
