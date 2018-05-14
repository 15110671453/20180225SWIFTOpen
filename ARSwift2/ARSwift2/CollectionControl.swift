//
//  CollectionControl.swift
//  ARSwift2
//
//  Created by admindyn on 2018/1/12.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class CollectionControl: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var  categoryItems:[String:[ItemContent]]!
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.white
        
        self.categoryItems = ["食品":[ItemContent.init(itemName: "喜梅1", imageName: "meinv.jpg"),ItemContent.init(itemName: "喜梅2",imageName: "ball.jpg"),ItemContent.init(itemName: "喜梅3",imageName: "ball.jpg")],"手机":[ItemContent.init(itemName: "Iphone",imageName: "rainbow.jpg"),ItemContent.init(itemName: "三星",imageName: "feiji.jpg")],"饮料":[ItemContent.init(itemName: "天然水",imageName: "unicorn.png"),ItemContent.init(itemName: "杏仁露",imageName: "22.jpg"),ItemContent.init(itemName: "杏仁露2",imageName: "22.jpg"),ItemContent.init(itemName: "杏仁露3",imageName: "22.jpg")],"饮料2":[ItemContent.init(itemName: "天然水",imageName: "unicorn.png"),ItemContent.init(itemName: "杏仁露",imageName: "22.jpg"),ItemContent.init(itemName: "杏仁露2",imageName: "22.jpg"),ItemContent.init(itemName: "杏仁露3",imageName: "22.jpg")],"饮料3":[ItemContent.init(itemName: "天然水",imageName: "unicorn.png"),ItemContent.init(itemName: "杏仁露",imageName: "22.jpg"),ItemContent.init(itemName: "杏仁露2",imageName: "22.jpg"),ItemContent.init(itemName: "杏仁露3",imageName: "22.jpg")],"饮料4":[ItemContent.init(itemName: "天然水",imageName: "unicorn.png"),ItemContent.init(itemName: "杏仁露",imageName: "22.jpg"),ItemContent.init(itemName: "杏仁露2",imageName: "22.jpg"),ItemContent.init(itemName: "杏仁露3",imageName: "22.jpg")]]
        
        
        let btn:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btn.frame=CGRect(x:120,y:30,width:200,height:40)
        
        btn.addTarget(self, action: #selector(CollectionControl.doBack(sender:)), for: UIControlEvents.touchUpInside)
        
        btn.setTitle("点击返回", for: UIControlState.normal)
        
        btn.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn)
        
        
          let collectV:UICollectionView! = UICollectionView.init(frame: CGRect(x:0,y:100,width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height - 100 - 20), collectionViewLayout: UICollectionViewFlowLayout())
        
        collectV.backgroundColor = UIColor.cyan
        
        
        collectV.delegate = self
        
        collectV.dataSource = self
        
        self.view.addSubview(collectV)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc   func doBack(sender:AnyObject)  {
        self.dismiss(animated: true) {
            
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return categoryItems.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var items = [ItemContent]()
        
        for (index,value) in categoryItems.enumerated() {
            
            
            if index == section {
                
                /*
                 元组 取值
                 */
                
                (_,items) = value
                
            }
        }
        
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reuseIdenti = "PhotoCell"
        
    collectionView.register(ItemCollectCell.classForCoder(), forCellWithReuseIdentifier: reuseIdenti)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdenti, for: indexPath) as! ItemCollectCell
        
        var items = [ItemContent]()
        
        for (index,value) in categoryItems.enumerated() {
            
            if index == indexPath.section {
                
                (_,items) = value
                
            }
            
        }
        
        
        let imageName = items[indexPath.row].imageName
        
        cell.imageV.image = UIImage(named:imageName)
        
        return cell
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        
        return true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        
        return true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        
        
        return true
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        
        return true
        
        
    }
    
    //MARK:FlowLayoutdelegate
    
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        /*
         每个项目单元格的宽高
         */
        
        if indexPath.section == 0   {
            
           return CGSize(width:100,height:120)
        }
        
        if indexPath.section == 1 {
            
            return CGSize(width:200,height:200)
        }
        
        if indexPath.section == 2 {
            
            return CGSize(width:340,height:340)
        }
        
      return CGSize(width:100,height:120)
      
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        /*
         指定每个section 每一行之间的间距
         */
        
        if section == 0 {
            
            return 10
            
        }
        
        if section == 1 {
            
            return 40
            
        }
        
        if section == 2 {
            
            return 20
            
        }
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        /*
         指定每个section 每个项目之间的间距
         */
        
        
        if section == 0 {
            
            return 20
            
        }
        
        if section == 1 {
            
            return 40
            
        }
        
        if section == 2 {
            
            return 60
            
        }
        
        return 20
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        /*
         调整每个视图的内边距
         */
        /*
         上 左 下 右
         */
        return UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
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
