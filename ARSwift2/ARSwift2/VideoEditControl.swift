//
//  VideoEditControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class VideoEditControl: UIViewController,UIVideoEditorControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.white
        
        let btnD:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnD.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:84,width:200,height:40)
        
        btnD.addTarget(self, action: #selector(VideoEditControl.doSendEdit(sender:)), for: UIControlEvents.touchUpInside)
        
        btnD.setTitle("编辑视频click", for: UIControlState.normal)
        
        btnD.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btnD)

        
        let btnA:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnA.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:164,width:200,height:40)
        
        btnA.addTarget(self, action: #selector(VideoEditControl.doBack(sender:)), for: UIControlEvents.touchUpInside)
        
        btnA.setTitle("返回上一页", for: UIControlState.normal)
        
        btnA.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btnA)

        
        // Do any additional setup after loading the view.
    }
    
  @objc  func doBack(sender:AnyObject) {
    
    self.dismiss(animated: true) {
        
    }
    
    }
    
   @objc func doSendEdit(sender:AnyObject)  {
        
        let bundle = Bundle.main
        
        let moviePath = bundle.path(forResource: "test", ofType: ".mp4")
        
        //判断设备是否支持 视频编辑
        
        if UIVideoEditorController.canEditVideo(atPath: moviePath!) {
            
            
            let videoEdit = UIVideoEditorController()
            
            videoEdit.delegate = self
            
            videoEdit.videoPath = moviePath!
            
            self.present(videoEdit, animated: true, completion: {
                
            })
            
            
        } else {
            
            print("不能编辑这个视频")
        }
    }
    
    // MARK:VideoEditDelegate
    
    func videoEditorControllerDidCancel(_ editor: UIVideoEditorController) {
        
         print("编辑视频取消操作")
        editor.dismiss(animated: true) {
            
        }
        
    }
    
    func videoEditorController(_ editor: UIVideoEditorController, didFailWithError error: Error) {
        
        print("编辑视频出错")
        editor.dismiss(animated: true) {
            
        }
    }
    
    func videoEditorController(_ editor: UIVideoEditorController, didSaveEditedVideoToPath editedVideoPath: String) {
        
        
        editor.dismiss(animated: true) {
            
        }
        
        if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(editedVideoPath) {
            
            
            UISaveVideoAtPathToSavedPhotosAlbum(editedVideoPath, self,#selector(VideoEditControl.video(video:didFinishedSavingWithError:contectInfo:)), nil)
        }
        
    }

    @objc func video(video:String,didFinishedSavingWithError error:NSError?,contectInfo:UnsafeMutablePointer<Void>)  {
        
        var title = ""
        
        var message = ""
        
        
        if error != nil {
            
            title = "处理失败"
            
            message = (error?.localizedDescription)!
        } else {
            
            title = "编辑视频已经保存"
            
            message = "编辑视频已经保存到设备的相机胶卷中"
        }
        
        let alert = UIAlertView(title:title,message:message,delegate:nil,cancelButtonTitle:"OK")
        
        alert.show()
        
        
        
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
