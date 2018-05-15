#!/usr/bin/env bash

which swiftc

chmod 777 swiftc

echo $SWIFT_HOME

cp $SWIFT_HOME/usr/bin/* ./

swift-build