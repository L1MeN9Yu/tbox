#!/usr/bin/env bash
rm -rf ./xmake
rm -rf build

xmake m package -p iphoneos -f "--demo=no --exception=y --regex=y --hash=y --zip=y --coroutine=y --exception=y --object=y --xml=y --charset=y --target_minver=10 --cxflags=\"-fembed-bitcode\" --mxflags=\"-fembed-bitcode\" --asflags=\"-fembed-bitcode\""

mkdir -p build/iOS/fat/lib

mv build/tbox.pkg/iphoneos/universal/lib/release/libtbox.a build/iOS/fat/lib/libtbox.a
rm -rf build/tbox.pkg/iphoneos/universal
rm -rf build/tbox.pkg/iphoneos/armv7/lib/release/
rm -rf build/tbox.pkg/iphoneos/armv7s/lib/release/
rm -rf build/tbox.pkg/iphoneos/arm64/lib/release/
rm -rf build/tbox.pkg/iphoneos/i386/lib/release/
rm -rf build/tbox.pkg/iphoneos/x86_64/lib/release/
mv -f build/tbox.pkg/iphoneos build/iOS/fat/include
rm -rf build/tbox.pkg build/iphoneos
