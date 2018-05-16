//
//  hiredis-bridge.h
//  SwiftBasicMac
//
//  Created by admindyn on 2018/5/10.
//  Copyright © 2018年 admindyn. All rights reserved.
//

#ifndef hiredis_bridge_h
#define hiredis_bridge_h

#include <stdio.h>
#include "hiredis.h"


redisReply * redisSendCommand(redisContext*c,const char* format);





#endif /* hiredis_bridge_h */
