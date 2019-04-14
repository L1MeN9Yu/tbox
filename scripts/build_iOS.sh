#!/usr/bin/env bash
rm -rf ./xmake

##--coroutine=y

xmake f --hash=y --zip=y -p iphoneos -a armv7 --target_minver=9 --cxflags="-fembed-bitcode " --mxflags="-fembed-bitcode"
xmake p tbox

xmake f --hash=y --zip=y -p iphoneos -a armv7s --target_minver=9 --cxflags="-fembed-bitcode" --mxflags="-fembed-bitcode"
xmake p tbox

xmake f --hash=y --zip=y -p iphoneos -a arm64 --target_minver=9 --cxflags="-fembed-bitcode" --mxflags="-fembed-bitcode"
xmake p tbox

xmake f --hash=y --zip=y -p iphoneos -a i386 --target_minver=9 --cxflags="-fembed-bitcode" --mxflags="-fembed-bitcode"
xmake p tbox

xmake f --hash=y --zip=y -p iphoneos -a x86_64 --target_minver=9 --cxflags="-fembed-bitcode" --mxflags="-fembed-bitcode"
xmake p tbox

mkdir build/iOS/ build/iOS/fat/

lipo -create \
build/tbox.pkg/lib/release/iphoneos/armv7/libtbox.a \
build/tbox.pkg/lib/release/iphoneos/armv7s/libtbox.a \
build/tbox.pkg/lib/release/iphoneos/arm64/libtbox.a \
build/tbox.pkg/lib/release/iphoneos/i386/libtbox.a \
build/tbox.pkg/lib/release/iphoneos/x86_64/libtbox.a \
-output \
build/iOS/fat/libtbox.a

mv build/tbox.pkg/inc/tbox build/iOS/fat/include
rm -rf build/tbox.pkg build/iphoneos
