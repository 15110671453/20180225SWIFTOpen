//
//  CFramWork.c
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/9.
//  Copyright © 2018年 admindyn. All rights reserved.
//
//MARK:Process

#ifdef __APPLE__
//苹果操作系统!



#if TARGET_IPHONE_SIMULATOR

// 苹果下的iOS 模拟器操作系统



#elif TARGET_OS_IPHONE
// 苹果下的iOS操作系统

#elif TARGET_OS_MAC
// 苹果下的MAC 操作系统


#else

// 苹果下的其他 操作系统

#endif

#elif __linux__
//linux操作系统!
/* for socket/bind/listen() */


#else
//其他操作系统 可能是 UNIX 或者 Windows


#endif



#include <stdlib.h>
#include <string.h>
#include "CFramWork.h"


size_t  cFuncStrlen(const char* str)
{
    
    return strlen(str);
    
}

int cFuncStr(const char *str)
{
    printf("输出c字符串 %s \n",str);
    
    return *str;
}
void cFuncInt(const int *str)
{
    printf("输出c数组 %lx",str);
     printf("输出c数组 首元素 %lx \n",*str);
}
void set_callback(void (*functionPtr)(void*),void const *userData)
{

    functionPtr(userData);
}
