//
//  ViewController.swift
//  ARSwift2
//
//  Created by admindyn on 2017/12/28.
//  Copyright © 2017年 admindyn. All rights reserved.
//
import Alamofire
import UIKit

class ViewController: UIViewController {
    
    func swiftHttp() {
        print("ViewController 测试 Alamofire Http")
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print("Request-Out: \(String(describing: response.request))")   // original url request
            print("Response-Out: \(String(describing: response.response))") // http url response
            print("Result-Out: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON-Out: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data-Out: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    
    @objc func btnPushClick(btn:UIButton)  {
         //MARK:Quartz
        let aniControl = AnimationControl()
        
        let navControl:NavControlQuartz = NavControlQuartz(rootViewController:aniControl)
        
        
        self.present(navControl, animated: false) {
            
        }
        
    }
    
   @objc func collectionView(sender:AnyObject)  {
    
    //MARK:CoolectionView
    let collect = CollectionControl()
    
    self.present(collect, animated: true) {
        
    }
    
        
    }
    
    @objc func btnClick(btn:UIButton)  {
       
         //MARK:ImageDraw
        let imageComtrol:ImageDrawControl = ImageDrawControl()
        self.present(imageComtrol, animated: false) {
            
        }
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        swiftHttp();
        let que:QueueManager = QueueManager()
        
        que.qosConcurrentQueues()
        que.delayQueue()
        
        let imageProcess = ImageRequestor()
        
    imageProcess.fetchImage(urlString: "http://ovu4rxd0y.bkt.clouddn.com/66.jpg", completion: { [weak self] (image) in
        
        let iv:UIImageView = UIImageView(image:image)
        iv.frame = CGRect(x:10, y:30, width:100, height:100)
            
        self?.view.addSubview(iv)
        print("block normal回调 图片异步下载")
        })
        imageProcess.fetchImageResumeData(urlString: "http://ovu4rxd0y.bkt.clouddn.com/66.jpg") { [weak self] (image) in
            
            let iv:UIImageView = UIImageView(image:image)
            iv.frame = CGRect(x:10, y:150, width:100, height:100)
            
            self?.view.addSubview(iv)
            print("block resumedata回调 图片异步下载")
            
            
        }
    
        imageProcess.fetchImageProgress(urlString: "http://ovu4rxd0y.bkt.clouddn.com/66.jpg") { [weak self] (image) in
            
            let iv:UIImageView = UIImageView(image:image)
            iv.frame = CGRect(x:10, y:270, width:100, height:100)
            
            self?.view.addSubview(iv)
            print("block progress回调 图片异步下载")
            
            
        }
        
          //rainbow.jpg unicorn.png
        imageProcess.uploadMultipleFile(unicornImageName: "unicorn", rainbowImageName: "rainbow")
        
        
        let btn:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btn.frame=CGRect(x:120,y:30,width:200,height:40)
        
        btn.addTarget(self, action: #selector(ViewController.btnClick(btn:)), for: UIControlEvents.touchUpInside)
        
        btn.setTitle("点击进入下一页Image", for: UIControlState.normal)
        
        btn.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn)
        
        
        let btn2:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btn2.frame=CGRect(x:120,y:90,width:200,height:40)
        
        btn2.addTarget(self, action: #selector(ViewController.btnPushClick(btn:)), for: UIControlEvents.touchUpInside)
        
        btn2.setTitle("点击进入下一页-Quartz", for: UIControlState.normal)
        
        btn2.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn2)
        
        
        let btn3:UIButton = UIButton.init(type: UIButtonType.custom)
        
        btn3.frame=CGRect(x:120,y:150,width:200,height:40)
        
        btn3.addTarget(self, action: #selector(ViewController.collectionView(sender:)), for: UIControlEvents.touchUpInside)
        
        btn3.setTitle("点击进入下一页-列表-clollection", for: UIControlState.normal)
        
        btn3.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        self.view.addSubview(btn3)
        
        
        let obj:ObjSwift = ObjSwift(name:"dyn",age:27);
        
       let re =  obj.logMes(message: "上网")
        
        print("\(obj.test)")
        print(obj.test)
        print("注意这里输出 可选型的 成员变量 不是只输出值 而是optional(value)")
        
        print(obj.testOptional)
        obj.testOptional = "opt te"
        print(obj.testOptional)
        
        print(obj.testOptionalInt)
        print("以上 都会有警告  因为 可选型数据变量 不可以 与普通类型 直接进行计算 或处理")
        
        //print(obj.testOptionalInt+100)
        print("以上 编译报错  当可选型数据类型 与 普通类型 进行运算时 要先拆包 否则 编译报错")
        
        
        print("对于可选型 数据 我们 又有 两种情况 当我们  又想对当前变量 赋值为nil（必须可选型）又不想每次对该变量 显式拆包 就 使用！ 声明可选型变量")
        
        print(obj.testOptionalInt! + 100)
        
        let res = obj.testOptionalInt!
        
        let res2 = obj.testOptionalInt
        
        print("输出可选型 传值:\(res) :\(res2)")
        print("log mes result:\(re)")
        
        
        print("当我们 不确定当前接收到的可选型值 是否为空 时  我们最好不要拆包 ")
        /*
         我们调用的函数 返回的为可选型 kennel有值 也可能为空 为了能够接受返回值为空的情况 我们需要将返回值类型 声明为可选型
         */
        let result:Double? = obj.divide(n1: 100, n2: 200)
        
        if let reS = obj.divide(n1: 100, n2: 0) {
            
            print(reS)
            print("Success")
            print("这种可选类型在if或while语句中赋值并进行判断的写法 称为 可选绑定")
            print("过程 分两步 第一首先判断 表达式 是否为空值nil 如果为 非空则将可选类型值拆包 并赋值给一个常量")
            
        } else
        {
            print("failure")
            print("这种可选类型在if或while语句中赋值并进行判断的写法 称为 可选绑定")
        }
        
        let smile:Character = "\u{0001f603}"
        print("这里注意 我们在指定变量或常量类型为Character 但是如果省略Character 类型声明 编译器自动推断出的类型不是字符型 而是字符串型 ")
        let smile2 = "\u{0001f603}"
        
        print(smile)
        print(smile2)
        
        print("字符串个数:\(smile2.count)")
        
        _ = ""
        
        let emptyString2 = String()
        
        print("字符串个数:\(emptyString2.count)")
        
        
        let obj2:ObjString = ObjString()
        
        obj2.handleString(message: "message")
        
        
        let obGuard:ObjGuard = ObjGuard()
        
        
        let bl:Blog = Blog(name: "12",url: "34",author: "56")
        
        
        
        obGuard.guardStyleBlog(blog: bl)
        
   
        
        let objSw:ObjSwitch = ObjSwitch()
        
        objSw.doSwitch(tuple: objSw.student)
        
        let objSet:ObjSet = ObjSet()
        
        //        objSet.doHandleSet(listAr: ["100","101","102"])
        
        objSet.doHandleSet(listSet: ["山西","山东","北京"])
         
        objSet.doArray(listArr: ["China","USA","France","USA"])
        
        objSet.doDictinary(listDic: [102:"张三",103:"李四",104:"王五"])
        
        let objFunc:ObjFunction = ObjFunction()
        
        var valueD:Double = 10.0
        
        print("将值类型 valueD 用引用方式传递函数 前 valueD 为: \(valueD)")
        objFunc.pasValueToPasRef(value: &valueD)
        
        print("将值类型 valueD 用引用方式传递函数 后 valueD 变为: \(valueD)")
        
        objFunc.testArea()
        
        objFunc.doBlock()
        
        let objEnum = ObjEnumStruct()
        
        objEnum.writeGreeting(day: WeekDays.Friday)
        
        let fig = Figure.Rectangle(10, 9)
        
        objEnum.printFigureEnum(figure: fig)
        
        
        print("以下 类 与 结构体 都是调用它们的构造函数实现实例化")
        print("实例化 之后 就会 开辟内存空间 emp 和 dept 称为 实例 但只有 类实例化的 实例 才能称为 对象 。事实上 不仅仅结构体和类可以实例化 ，枚举 函数类型 和 闭包 开辟内存空间的过程也可以称为实例化 结果可以叫实例 但是 不能叫 对象")
        
        
//        let dept = Department()
//        dept.no = 10
//        dept.name = "Sales"
        
        print("上面结构体 实例化 赋值给 let 变量 然后 对结构体成员进行 修改值 发现报错 不可以修改 证明 结构体是值类型数据 赋值给 let变量的 那么 又是let的 常量 不可以修改 它的成员变量")
        
        
//        let dept4 = Department()
//        dept4.no = 10
//        dept4.name = "Sales"
        
        /*
         以上let的 直接报错
         */
        
        var dept = Department()
        dept.no = 10
        dept.name = "Sales"
        
        dept.no = 911
        
        var dept1 = Department()
        dept1.no = 10
        dept1.name = "Sales"
        
        dept1.no = 911
        
        var dept2 = Department()
        dept2.no = 10
        dept2.name = "Sales"
        
        
        dept2.no = 911
        
         print("但是 实例化类 赋值给 let 变量 同样是常量  但由于是引用类型 我们可以修改它的成员 但是不可以在对emp自己修改")
        let emp = Employee()
        emp.no = 1000
        emp.name = "Martin"
        emp.job = "SalesMan"
        emp.dept = dept
        
        print("Department更新前: \(dept.name)")
        
        print("Department更新后: \(emp.dept?.name)")
        
        objEnum.updateDept(dept: &dept)
        
        print("Department更新后: \(dept.name)")
      
        print("Department更新后: \(emp.dept?.name)")
        
        print("Employee 更新前: \(emp.job)")
        
        objEnum.updateEmp(emp: emp)
        
        print("Employee 更新后: \(emp.job)")
        
        if (dept == dept1) {
            print("两个结构体 dept == dept1运算符重载 进行比较 后 相等")
        } else
        {
            print("两个结构体 dept == dept1运算符重载 进行比较 后 不相等")
            
        }
        if (dept1 == dept2) {
            print("两个结构体dept1 == dept2 运算符重载 进行比较 后 相等")
        } else
        {
            print("两个结构体dept1 == dept2 运算符重载 进行比较 后 不相等")
            
        }
        
        print("可选连中的问号  与 声明可选类型中的问号（声明可选类型问号 是因为我们程序员知道我们要声明一个 可以设置为nil的变量 所以要是可选型 但是我们又不知道 这个以后访问有可能被修改（因此多是var）为nil 因此使用问号）")
        print("可选连中的感叹号  与 声明可选类型中的感叹号（声明可选类型感叹号 是因为我们程序员知道我们要声明一个 可以设置为nil的变量 所以要是可选型 但是我们又知道 这个以后访问不可能被修改（因此多是var）为nil 因此使用感叹号 ）")
        
        print("可选连使用 问号 是因为 担心 某个环节返回空值 导致程序 崩溃 因此使用 问号 同时注意这里最后name 返回的值 变为了 可选型 但是在Company类中 它原本不是可选型")
        print(emp.deptObj?.comp?.name)
        
        print(emp.fullName)
        
        emp.fullName = "pujing.telangpu"
        
        print(emp.fullName)
        
        emp.name = "chineseMan"
        
        let p1:Person = Person.init()
        
        print(p1.decription())
        
        
        
        let student1:Student = Student.init(name: "学生甲", age: 28)
        
         print(student1.decription())
        
        
        
        let gra:Graduate = Graduate.init()
        
         print(gra.decription())
        
        
        gra.name = "name-Graduate"
        
        print(gra.decription())
        
        let  wok:Worker = Worker.init(name: "test1", age: 100, factory: "白宫")
        
        wok.test()
        
        let objCate:ObjCategory = ObjCategory()
        
        
        
        
        objCate.test()
        
        var ary2 = SquareMatrix.init(rows: 5, columns: 5)
        
        for i in 0..<5 {
            
            for j in 0..<5 {
                
                ary2[i,j] = i + j
                
            }
            
        }
        
        
        for i in 0..<5 {
            
            for j in 0..<5 {
                
                print("\t\t \(ary2[i,j])")
                
            }
            
            print("\n")
            
        }
        
        let empD = Employee.init()
        
        let strCon:String = empD.fullNameBlock3("首都","北京")
        
        print("\(strCon)")
        
        
        let  daoNote:NoteDAO = NoteDAO()
        
        do {
            
            print("try? findAll() 如果函数或方法抛出错误 程序不会崩溃 而是返回一个nil ;如果没有跑出错误 则返回可选值")
           
            //TODO: 练习do-catch
            let res = try?  daoNote.findAll()
            
            if res == nil {
                
                
                
            }
            
        } catch DAOError.NoData {
            //FIXME: 这里的异常为什么无法Catch
            print("没有数据")
            
        } catch DAOError.PrimaryKeyNull {
            
            print("没有数据")
            
        }
        
       let error = try? daoNote.findAll()
        
        if error == nil {
            print("nil 空")
        }
        
        
        let coco:SwiftCoco = SwiftCoco()
        
        coco.testNumber()
        
        coco.testString()
        
        coco.testArray()
        
        coco.testDict()
        
        coco.testSet()
        
        //MARK:代码结束
        
        
        
        
        
        /*
         用let 还是 var
         
         如果数据类型是 引用类型 最好声明为let  let声明的引用数据类型 不会改变引用（即 指针）
         但可以改变其内容
         
         
         那么 值类型 主要是 整型 浮点型 布尔型 字符 字符串 元组 集合 枚举 结构体
         
         引用类型 主要是 类
         */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

