//
//  CameraFoundationControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit
import AVFoundation
import AssetsLibrary

class CameraFoundationControl: UIViewController,AVCaptureFileOutputRecordingDelegate {
    
  
    //MARK:AVCaptureFileOutputRecordingDelegate
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        
        
        if error == nil {
            var library = ALAssetsLibrary()
            
            library.writeVideoAtPath(toSavedPhotosAlbum: outputFileURL, completionBlock: { (assetURL, error) in
                
                
                print("写入")
            })
            
        }
        
    }
    

    var label:UILabel!
    
    
    var btn:UIButton!
    
    var session:AVCaptureSession!
    
    var outPut:AVCaptureMovieFileOutput!
    
    
    var isRecording = false
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.label = UILabel()
        
        label.frame = CGRect(x:self.view.frame.midX - 100,y:0,width:200,height:60)
        
        label.text = "信息"
        
        label.textColor = UIColor.black
        
        
        
        self.view.addSubview(label)
        
        
        
        let btnB = UIButton()
        
        btnB.frame = CGRect(x:0,y:self.view.frame.maxY - 60,width:240,height:30)
        
        btnB.setTitle("取消", for:.normal)
        
        btnB.setTitleColor(UIColor.red, for: .normal)
        
        btnB.addTarget(self, action: #selector(CameraFoundationControl.doBack), for: .touchUpInside)
        
        self.view.addSubview(btnB)
        
        
        self.btn = UIButton()
        
        btn.frame = CGRect(x:0,y:self.view.frame.maxY - 100,width:240,height:30)
        
        btn.setTitle("录制", for:.normal)
        
        btn.setTitleColor(UIColor.red, for: .normal)
        
        btn.addTarget(self, action: #selector(CameraFoundationControl.recordPressed(sender:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        
        
        self.session = AVCaptureSession()
        
        session.sessionPreset = .medium
        
        let cameraDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        
        
        
        do {
            let camera = try  AVCaptureDeviceInput.init(device: cameraDevice!)
            
            let micDevice = AVCaptureDevice.default(for: AVMediaType.audio)
            
             let mic = try AVCaptureDeviceInput.init(device: micDevice!)
            
            
            
            self.session.addInput(camera)
            
            self.session.addInput(mic)
            
            self.outPut = AVCaptureMovieFileOutput()
            
            if self.session.canAddOutput(self.outPut) {
                
                
                self.session.addOutput(self.outPut)
                
            }
            
            let previewLayer = AVCaptureVideoPreviewLayer(session:self.session)
            
            previewLayer.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
            
            
        self.view.layer.insertSublayer(previewLayer, at: 0)
            
            
            self.session.startRunning()
            
            self.isRecording = false
            
            self.label.text = "摄像头链接就绪 点击录制"
            
            
        } catch is NSError {
            
            
            print("异常-摄像头获取")
             print("麦克风 获取异常")
        }
        
       
        
      
        
        
        
        
        
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @objc func recordPressed(sender:AnyObject) {
        
        
        if !self.isRecording {
            
            self.btn.setTitle("停止", for: .normal)
            
            self.label.text = "录制中..."
            
            
            self.isRecording = true
            
            let fileURL = self.fileURL()
            
        self.outPut.startRecording(to: fileURL as! URL, recordingDelegate: self)
            
            
            
        } else {
            
            self.btn.setTitle("录制", for: .normal)
            
            self.label.text = "已经停止"
            
            self.outPut.stopRecording()
            
            
            self.isRecording = false
            
        }
    }
    
    func fileURL() -> NSURL? {
        
        let outPath  = String.init(format: "%@%@", NSTemporaryDirectory(),"movie.mov")
        
        let outPutURl = NSURL.init(fileURLWithPath: outPath)
        
        let manager = FileManager()
        
        if manager.fileExists(atPath: outPath) {
            
            do {
                
            try manager.removeItem(atPath: outPath)
                
            }catch is NSError {
                
                
            }
            
            
            
        }
        
        
        
        
        return outPutURl
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
