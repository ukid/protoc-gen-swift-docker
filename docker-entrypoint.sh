#!/bin/bash
export LD_LIBRARY_PATH=/usr/local/lib

uname -a
echo "========================================================================"  
echo "Begin to compile proto file to swift!"

echo '/usr/lib/swift/linux' > /etc/ld.so.conf.d/swift.conf
ldconfig

PROTO_DIR=/protos
TARGET_DIR=/out

rm -rf $TARGET_DIR/*

for f in $PROTO_DIR/*.proto
do
    protoc $f \
    --proto_path=$PROTO_DIR \
    --plugin=/usr/local/bin/protoc-gen-swift \
    --swift_opt=Visibility=Public \
    --swift_out=$TARGET_DIR \
    --plugin=/usr/local/bin/protoc-gen-grpc-swift \
    --grpc-swift_opt=Visibility=Public \
    --grpc-swift_out=$TARGET_DIR
done

echo "Done!"
