

###最低版本要求
cmake_minimum_required(VERSION 2.8)

###项目信息
project(hiredis_bridge C)

###添加编译选项


###指定Debug编译模式("$ cmake -DCMAKE_BUILD_TYPE=Debug ..")
if(NOT CMAKE_BUILD_TYPE)
  message(STATUS "Setting build type to 'Debug' as none was specified.")
  set(CMAKE_BUILD_TYPE Debug)         #开发期间默认为Debug模式
  #set(CMAKE_BUILD_TYPE Release)
endif() 
set(CMAKE_C_FLAGS_DEBUG "$ENV{CFLAGS} -O0 -g -ggdb -funsigned-char")
set(CMAKE_C_FLAGS_RELEASE "$ENV{CFLAGS} -O3")

#set(LIB_NOT_COMPILED Lib_not_compiled)
###指定编译结果生成路径

SET(CMAKE_INSTALL_PREFIX ~/CLionProjects/Swift_Linux/Sources/hiredis_bridge/build) 
SET(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
SET(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib)

set(REDIS_LIB ~/CLionProjects/Swift_Linux/Sources/redis)
set(REDIS_INCLUDE ~/CLionProjects/Swift_Linux/Sources/redis)

link_directories(${REDIS_LIB})
include_directories(${REDIS_INCLUDE})
###编译子目录
add_subdirectory(sources)
