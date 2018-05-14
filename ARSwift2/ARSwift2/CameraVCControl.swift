//
//  CameraVCControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit
import MobileCoreServices

class CameraVCControl: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let btnA:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnA.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:44,width:200,height:40)
        
        btnA.addTarget(self, action: #selector(CameraVCControl.doBack), for: UIControlEvents.touchUpInside)
        
        btnA.setTitle("返回上一页", for: UIControlState.normal)
        
        btnA.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btnA)
        
        let btnB:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnB.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:94,width:200,height:40)
        
        btnB.addTarget(self, action: #selector(CameraVCControl.usePickerControlCamera(sender:)), for: UIControlEvents.touchUpInside)
        
        btnB.setTitle("ImagePickerControl摄像头", for: UIControlState.normal)
        
        btnB.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btnB)
        
        let btnC:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnC.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:144,width:200,height:40)
        
        btnC.addTarget(self, action: #selector(CameraVCControl.useAvFoundationCamera(sender:)), for: UIControlEvents.touchUpInside)
        
        btnC.setTitle("AvFoundation摄像头", for: UIControlState.normal)
        
        btnC.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btnC)
        
        
        let btnD:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btnD.frame=CGRect(x:UIScreen.main.bounds.width/2-200/2,y:204,width:200,height:40)
        
        btnD.addTarget(self, action: #selector(CameraVCControl.doEditor(sender:)), for: UIControlEvents.touchUpInside)
        
        btnD.setTitle("编辑视频", for: UIControlState.normal)
        
        btnD.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btnD)

        // Do any additional setup after loading the view.
    }

    @objc func doEditor(sender:AnyObject)  {
        
        //MARK:编辑视频
        
        let edit = VideoEditControl()
        
        self.present(edit, animated: true) {
            
        }
        
        
    }
    
    @objc func useAvFoundationCamera(sender:AnyObject)  {
        
        
        let cameraFound = CameraFoundationControl()
        
        self.present(cameraFound, animated: true) {
            
        }
        
        
    }
    
    @objc func usePickerControlCamera(sender:AnyObject)  {
        /*
         Privacy - Photo Library Additions Usage Description
         Privacy - Microphone Usage Description
         Privacy - Camera Usage Description
         */
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let imagPicker = UIImagePickerController()
            
            imagPicker.delegate = self
            
            imagPicker.sourceType = .camera
            
           // imagPicker.mediaTypes = [kUTTypeImage]
            
            imagPicker.mediaTypes = [kUTTypeMovie as String]
            
            //录制视频质量
            
            imagPicker.videoQuality = .typeHigh
            
            //允许录制30s时间
            
        imagPicker.videoMaximumDuration = 30.0
            
            self.present(imagPicker, animated: true, completion: {
                
            })
            
            
        } else {
            
            print("摄像头 不可用")
            
        }
        
    }
    @objc func doBack()  {
        self.dismiss(animated: true) {
            
        }
    }
    
    //MARK:ImagePickerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true) {
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let url = info[UIImagePickerControllerMediaURL] as! NSURL
        
        let tempPath = url.path
        
        if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(tempPath!) {
            
            
            UISaveVideoAtPathToSavedPhotosAlbum(tempPath!, self, #selector(CameraVCControl.video(video:didFinishedSavingWithError:contectInfo:)), nil)
            
        }
        
        picker.dismiss(animated: true) {
            
        }
        
        
        
    }
    
    @objc func video(video:String,didFinishedSavingWithError error:NSError?,contectInfo:UnsafeMutablePointer<Void>)  {
        
        var title = ""
        
        var message = ""
        
        
        if error != nil {
            
            title = "录制失败"
            
            message = (error?.localizedDescription)!
        } else {
            
            title = "视频已经保存"
            
            message = "视频已经保存到设备的相机胶卷中"
        }
        
        let alert = UIAlertView(title:title,message:message,delegate:nil,cancelButtonTitle:"OK")
        
        alert.show()
        
        
        
    }
    
    //MARK:NAVControllerDelegate
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
         print("选择器显示结束")
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print("选择器将要显示")
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
