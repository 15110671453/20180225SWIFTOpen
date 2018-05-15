cmake_minimum_required(VERSION 3.10)
project(Swift_Linux)

add_custom_target(Swift_Linux ALL
        COMMAND /home/admindyn/Desktop/swift-4.0-DEVELOPMENT-SNAPSHOT-2017-12-04-a-ubuntu16.10/usr/bin/swift build
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES  Package.swift Sources/main.swift  Sources/RunLoop_SWF.swift Sources/Redis_Handler.swift Sources/FanXing_SWF.swift Sources/CPointer_SWF.swift Sources/Basic_SWF.swift)
