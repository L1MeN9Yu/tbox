xmake f -p iphoneos -a armv7 --cxflags="-fembed-bitcode -miphoneos-version-min=9" --mxflags="-fembed-bitcode -miphoneos-version-min=9"
xmake p

xmake f -p iphoneos -a armv7s --cxflags="-fembed-bitcode -miphoneos-version-min=9" --mxflags="-fembed-bitcode -miphoneos-version-min=9"
xmake p

xmake f -p iphoneos -a arm64 --cxflags="-fembed-bitcode -miphoneos-version-min=9" --mxflags="-fembed-bitcode -miphoneos-version-min=9"
xmake p

xmake f -p iphoneos -a i386 --cxflags="-fembed-bitcode -miphoneos-version-min=9" --mxflags="-fembed-bitcode -miphoneos-version-min=9"
xmake p

xmake f -p iphoneos -a x86_64 --cxflags="-fembed-bitcode -miphoneos-version-min=9" --mxflags="-fembed-bitcode -miphoneos-version-min=9"
xmake p

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
