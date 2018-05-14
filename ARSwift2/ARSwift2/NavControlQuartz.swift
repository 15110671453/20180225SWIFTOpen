//
//  NavControlQuartz.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/11.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class NavControlQuartz: UINavigationController {

   
    //MARK:重写存储属性 为 这个时ViewControl的协议属性
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            
            return .default
        }
    }
    
   
    
    override func viewDidLoad() {
        
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
