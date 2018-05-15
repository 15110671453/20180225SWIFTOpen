//
//  hiredis-bridge.c
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/10.
//  Copyright © 2018年 admindyn. All rights reserved.
//



#include "hiredis_bridge.h"
/*
 Swift虽然能兼容大量C语言语法，但是对于Variadic function和通过Macro定义的方法是无法导入的。可是C语言这些灵活的特性又是经常被很多C库使用，所以在使用Swift封装C库的时候就会频频遇到这样的问题。遇到这样的问题，我们可以通过建立一个C库来桥接原始库，重写这些方法
 
 */

redisReply * redisSendCommand(redisContext*c,const char* format)
{
    redisReply *reply;
    reply = (redisReply*)redisCommand(c, format);
    
    return reply;
    

}













