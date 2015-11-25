#!/bin/sh

# ndk-build clean
# ndk-build

# cat libs/armeabi/libopenaes.so aes.key >libopenaes.so
# cp -f libopenaes.so  libs/armeabi/libopenaes.so

# clean && release
ant clean release

# sign apk
jarsigner -digestalg SHA1 -sigalg MD5withRSA -keystore release.ks -storepass uccloud20130801 -keypass uccloud20130801 -signedjar Spollo.apk bin/Spollo-release-unsigned.apk cloudtest.keystore