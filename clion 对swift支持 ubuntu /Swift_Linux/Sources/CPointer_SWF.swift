//
//  CPointer_SWF.swift
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/14.
//  Copyright © 2018年 admindyn. All rights reserved.
//
//MARK:Process
#if os(Linux)
    import SwiftGlibc
let WUNTRACED = Int32(2)
let WNOHANG = Int32(1)
let SIGTERM = Int32(15)
#else
    import Darwin
#endif
import Foundation

/*
 设计模式
 https://legacy.gitbook.com/book/yourtion/swiftdesignpatterns/details
 
 如何在Swift中调用C
 比如 Redis 数据库的使用
 
 http://hearrain.com/2015/12/850
 
 首先 明确c中const 使用规则
 
 只有被const直接修饰的变量最终指向的内容不可变（忽略变量类型修饰符，即int， long等）。
 
 在const int *p中，忽略掉int，被const直接修饰的是*p，*p最终指向指针p指向的地址的内容，所以该内容不可变（至少不可以使用*p进行修改），而变量p没有被const直接修饰，所以指正变量p最终指向的内容（也就是p本身的值）是可变的。这样这一句可以等效于int const *p。（这两种声明有没有其他的不同之处，笔者暂时还不清楚）
 
 在int * const p中，指针变量p本const直接修饰，所以p的内容（地址）是不可变的，而p指向的地址的内容（即*p）没有被const直接修饰，所以p指向的地址的内容是可变的，即*p可以被再赋值
 
 Swift 中 UnsafePointer<Type>  等同于 C指针
 const Type* p
 
 UnsafeMutablePointer<Type> 等同于 C指针 Type* p
 
 */


//MARK:-  文件操作 C

enum RandomSource {
    
    static let file = fopen("/dev/urandom", "r")!
    static let queue = DispatchQueue(label: "random")
    
    static func get(count: Int) -> [Int8] {
        let capacity = count + 1 // fgets adds null termination
        var data = UnsafeMutablePointer<Int8>.allocate(capacity: capacity)
        defer {
            data.deallocate(capacity: capacity)
        }
        queue.sync {
            fgets(data, Int32(capacity), file)
        }
        return Array(UnsafeMutableBufferPointer(start: data, count: count))
    }
}




struct Function_Data {
    var func1Ptr = 0
    var func2Ptr = 0
    static var count = 0
    // class var count2 = 0
    /*
     Class properties are only allowed within classes; use 'static' to declare a static property
     */
    //结构体
    mutating func createCountIncrease()
    {
        Function_Data.count += 1
        
        print("生成结构体实例个数:\(Function_Data.count)")
    }
}
enum Value_Type:Int32 {
    /*
     原始值 模式 定义的 枚举
     */
    
    case VALUE_TYPE_INTV = 1
    /*
     case 之间 不能使用 逗号
     
     逗号 只在 一个 case 语句 定义 多个枚举成员时 使用
     */
    case VALUE_TYPE_STRUCTV = 2
    
}



class CPointer_SWF {
    
    func test()  {
        
        //MARK: c 中 调用swift
        struct CallbackUserData {
            func sayHello() {
                print("Hello world!" )
                
            }
        }
        let callback : @convention(c) (_ userData:UnsafeMutableRawPointer?) -> Void = {
            (userData) ->Void in
            
            let u = userData?.bindMemory(to: CallbackUserData.self, capacity: 1)
            /*
             我们需要手动进行内存管理，一般来说会使用得到的 Unmanaged 对象的 takeUnretainedValue 或者 takeRetainedValue 从中取出需要的 CF 对象，并同时处理引用计数。takeUnretainedValue 将保持原来的引用计数不变，在你明白你没有义务去释放原来的内存时，应该使用这个方法。而如果你需要释放得到的 CF 的对象的内存时，应该使用 takeRetainedValue 来让引用计数加一，然后在使用完后对原来的 Unmanaged 进行手动释放。为了能手动操作 Unmanaged 的引用计数，Unmanaged 中还提供了 retain，release 和 autorelease 这样的 "老朋友" 供我们使用
             */
            /*
             如果这个非托管对象的使用全程，能够保障被封装对象一直存活，我们就可以使用 passUnretained 方法，对象的生命周期还归编译器管理。如果非托管对象使用周期超过了编译器认为的生命周期，比如超出作用域，编译器自动插入 release 的 ARC 语义，那么这个非托管对象就是一个野指针了，此时我们必须手动 retain 这个对象，也就是使用 passRetained 方法。一旦你手动 retain 了一个对象，就不要忘记 release 掉它，方法就是调用非托管对象的 release 方法，或者用 takeRetainedValue 取出封装的对象，并将其管理权交回 ARC。但注意，一定不要对一个用 passUnretained 构造的非托管对象调用 release 或者 takeRetainedValue，这会导致原来的对象被 release 掉，从而引发异常。
             */
            
            print("c回调Swift\(String(describing: userData))")
            
            let useR = u?.pointee
            
            
            
            
            useR?.sayHello()
            
        }
        
        
        var userData = CallbackUserData()
        
        let reference2 = withUnsafePointer(to: &userData) { (pRe:UnsafePointer<CallbackUserData>) -> UnsafeRawPointer in
            
            //等同于UnsafePointer<Void>
            return UnsafeRawPointer(pRe)
        }
        
        print("userData:\(reference2)")
        //MARK:- 在 Swift 中调用包含函数指针参数的 C 函数
        
        set_callback(callback,reference2)
        
        
    }
    
    
    func test2()  {
        let size = 10
        
        let intPtr = UnsafeMutablePointer<Int32>.allocate(capacity: size)
        
        for idx in 0..<10 {
            intPtr.advanced(by: idx).pointee = Int32(idx)
        }
        
        intPtr.pointee = 100
        
        cFuncInt(intPtr)
        
        var strPtr = ["C指针","OC指针","Swift","JS-ES6","Python"]
        
        /*
         Swift  中 虽然 沿用 有 c 的& 取地址符
         但是 功能有所不同  要真的取得指针 和C API 交互
         需要
         */
        
        /*
         如果我们想对某个变量进行指针操作，我们可以借助withUnsafePointer这个辅助方法。这个方法接受两个参数，第一个是 inout的任意类型，第二个是一个闭包。Swift会将第一个输入转换为指针，然后将这个转换后的Unsafe的指针作为参数，去调用闭包
         */
        
        print("Swift 字符串 到 c 字符串指针")
        /*
         Swift 开辟内存  指针操作
         
         几个生命周期
         
         第一 开辟内存 内存引用到
         
         第二 内存初始化
         You can use methods like initialize(to:count:), initialize(from:), and moveInitialize(from:count:) to initialize the memory referenced by a pointer with a value or series of values.
         
         Initialized Memory
         Initialized memory has a value that can be read using a pointer’s pointee property or through subscript notation. In the following example, ptr is a pointer to memory initialized with a value of 23:
         let ptr: UnsafeMutablePointer<Int> = ...
         // ptr.pointee == 23
         // ptr[0] == 23
         
         */
        
        /*
         被UnsafeMutablePointe引用的内存有三种状态：
         
         1. Not Allocated
         
         2. Allocated but not initialized
         
         3. Allocated and initialized
         
         只有在状态3时，可以安全的使用pointee属性来set和get。
         */
        
        //MARK:- UnsafeMutablePointer
        let uint8Pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: 8)
        
        uint8Pointer.initialize(from: [39, 77, 111, 111, 102, 33, 39, 0])
        /*
         The following code temporarily rebinds the memory that uint8Pointer references from UInt8 to Int8 to call the imported C strlen function.
         */
        /*
         When you only need to temporarily access a pointer’s memory as a different type
         C 指针类型转换  临时
         */
        //MARK:- C指针内存类型临时转换1
        let len = uint8Pointer.withMemoryRebound(to: Int8.self, capacity: 8) { (p:UnsafeMutablePointer<Int8>) ->  Int8 in
            
            
            
            return Int8(cFuncStrlen(p))
            
        }
        print("c 获取 字符串长度 \(len)")
        
        /*
         C 指针类型转换 永远
         When you need to permanently rebind memory to a different type, first obtain a raw pointer to the memory and then call the bindMemory(to:capacity:) method on the raw pointer. The following example binds the memory referenced by uint8Pointer to one instance of the UInt64 type
         
         After rebinding the memory referenced by uint8Pointer to UInt64, accessing that pointer’s referenced memory as a UInt8 instance is undefined
         
         
         Unsafe[Mutable][Raw][Buffer]Pointer[<T>]
         
         Pointer are just memory addresses
         
         
         Direct memory access is Unsafe
         
         
         Mutable means you can write to it
         
         Raw mean it points to a blob of bytes
         
         Buffer means that it works like a collection
         
         Generic<T> pointer are typed
         
         
         */
        
        //MARK:- C指针内存类型永久转换2
        //MARK:- UnsafeMutableRawPointer2
        /*
         原生指针需要绑定了类型后,使用UnsafeMutablePointer才能对内存进行赋值
         */
        let uint64Pointer = UnsafeMutableRawPointer(uint8Pointer)
            .bindMemory(to: UInt64.self, capacity: 1)
        
        var fullInteger = uint64Pointer.pointee          // OK
        var firstByte = uint8Pointer.pointee
        
        //MARK: UnsafeMutableRawPointer 修改内存类型
        
        print("\(fullInteger) C指针 内存类型被改后 旧的引用指针操作为:\(firstByte)")
        let uint64PointerOff = uint64Pointer + 1
        
        let uint8PointerOff = uint8Pointer + 1
        
        print("\(uint64PointerOff.pointee) C指针 内存类型被改后 旧的引用指针操作为:\(uint8PointerOff.pointee)")
        
        let count = 2
        
        /*
         Swift 提供 MemoryLayout 帮我们检测 结构体的内存大小
         
         内存对齐问题
         
         MemoryLayout<Type> 是一个用于在编译时计算出特定类型(Type)的 size, alignment 以及 stride 的泛型类型。返回的数值以字节为单位。例如 Int16 类型的大小为 2 个字节，内存对齐为 2 个字节以及当我们需要连续排列多个 Int16 类型时，每一个 Int16 所需要占用的大小(stride)为 2 个字节。所有基本类型的 stride 都与 size 是一致的
         */
        //表示了 Int 类型的 stride 单个Int 的字节数
        let stride = MemoryLayout<Int>.stride
        print("Swift中 Int 类型的 字节数默认:\(stride)")
        //表示了 Int 类型的内存对齐
        let alignment = MemoryLayout<Int>.alignment
        
        let byteCount = stride * count
        
        // 2
        do {
            print("原生指针的 意义 就在于可以进行类型转换 读写操作")
            
            
            //MARK:- UnsafeMutableRawPointer2
            /*
             原生指针需要绑定了类型后,使用UnsafeMutablePointer才能对内存进行赋值
             */
            let pointer = UnsafeMutableRawPointer.allocate(bytes: byteCount, alignedTo: alignment)
            
            
            //MARK: - 使用 defer 来保证内存得到正确地释放。操作指针的时候，所有内存都需要我们手动进行管理
            
            
            defer {
                pointer.deallocate(bytes: byteCount, alignedTo: alignment)
            }
            
            
            pointer.storeBytes(of: 42, as: Int.self)
            
            /*
             注意 第一个参数 表示指针内存中偏移字节数
             然后 存储一个 Int 类型的数值
             */
            
            //MARK:- 等同于(pointer+stride).storeBytes(of: 6, as: Int.self)
            
            pointer.advanced(by: stride).storeBytes(of: 6, as: Int.self)
            
            let v = pointer.load(as: Int.self)
            
            print("虽然让面advance 指针偏移操作 但是发现pointer 并未改变 每次pointer 还是永远指向 指针首地址 指针偏移后:\(v)")
            
            let v2 = pointer.advanced(by: stride).load(as: Int.self)
            
            print("通过advance 指针偏移操作  指针偏移后输出-:\(v2)")
            
            //MARK: - 原生buffer指针初始化 从原生指针转换为buffer
            
            let bufferPointer = UnsafeRawBufferPointer(start: pointer, count: byteCount)
            
            for (index, byte) in bufferPointer.enumerated() {
                print("byte \(index): \(byte)")
            }
            
        }
        /*
         使用 UnsafeMutableRawPointer.allocate 方法来分配所需的字节数。我们使用了 UnsafeMutableRawPointer，它的名字表明这个指针可以用来读取和存储（改变）原生的字节
         */
        var strCon = "C指针"
        print("Swift 字符串长度:\(strCon.count)")
        
        let strPP = withUnsafePointer(to: &strCon) { (p:UnsafePointer<String>) -> UnsafePointer<String> in
            
            print("String 指针\(p)")
            
            
            return p
        }
        
        print("String 指针\(strPP)")
        
        
        
        let strPP22 = withUnsafePointer(to: &strCon) { (p:UnsafePointer<String>) -> String in
            
            print("String 指针\(p)")
            
            
            return "返回任意处理"
        }
        
        //MARK: -从指针转换为String对象
        print("String 指针\(strPP22)")
        
        let oldStr = strPP.pointee
        
        print("从指针转换为String对象:\(oldStr)")
        
        var test = strCon.withCString { (p:UnsafePointer<Int8>) -> Int8 in
            
            //MARK: - UnsafeRawPointer只能由其他指针用init方法得到，与UnsafePointer类似，没有allocate静态方法
            
            print("输出c的strlen计算模式字符串长度:\(cFuncStrlen(p))")
            
            
            let cV = Int8(cFuncStr(p))
            
            print("调用C函数返回值:\(cV)")
            
            print("swift指针返回值:\(cV)")
            
            let x = p.pointee
            print("\(x)")
            
            
            // Load the third value in memory
            
            //MARK:不带Raw的指针 才可以 Strideable
            
            let offsetPointer = p + 2
            let y = offsetPointer.pointee
            print("\(y)")
            
            
            return x
            
        }
        
        print("输出的是第一个字节的值 \(test)")
        
        do {
            /*
             先创建原生指针。我们通过将内存绑定(binding)到指定的类型上来创建类型指针。通过对内存的绑定，我们可以通过类型安全的方法来访问它
             */
            print("Converting raw pointers to typed pointers")
            
            let rawPointer = UnsafeMutableRawPointer.allocate(bytes: byteCount, alignedTo: alignment)
            defer {
                rawPointer.deallocate(bytes: byteCount, alignedTo: alignment)
            }
            
            let typedPointer = rawPointer.bindMemory(to: Int.self, capacity: count)
            
            typedPointer.initialize(to: 0, count: count)
            defer {
                typedPointer.deinitialize(count: count)
            }
            
            typedPointer.pointee = 42
            typedPointer.advanced(by: 1).pointee = 6
            
            print("类型安全的指针\(typedPointer.pointee)")
            
            print("类型安全的指针\(typedPointer.advanced(by: 1).pointee)")
            
            
            let bufferPointer = UnsafeBufferPointer(start: typedPointer, count: count)
            for (index, value) in bufferPointer.enumerated() {
                print("value \(index): \(value)")
            }
        }
        
        
        //MARK:- C文件操作2
        
        
        //MARK:- swift 数组 - C指针
        
        var array = [100, 2, 3, 4, 5]
        var arrayPtr = UnsafeMutableBufferPointer<Int>(start: &array, count: array.count)
        // baseAddress 是第一个元素的指针
        var basePtr = arrayPtr.baseAddress as! UnsafeMutablePointer<Int>
        
        print("数组首元素\(basePtr.pointee)")
        
        let voidPtr = UnsafeRawPointer(intPtr)
        
        let intPtrAgain = voidPtr.assumingMemoryBound(to: Int8.self)
        
        //cFunc(intPtrAgain)
        
        
        
        //generic_function(Value_Type.VALUE_TYPE_INTV,intPtrAgain );
        //generic_function(Value_Type.VALUE_TYPE_STRUCTV, &data);
        
        intPtr.deallocate(capacity: size)
        
        
    }
    
}
