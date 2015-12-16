#!/bin/sh

is_gradle=0
signed_apk=""

if [[ $# -ge 1 ]]; then
    is_gradle=1
fi

# ndk-build clean
# ndk-build

# cat libs/armeabi/libopenaes.so aes.key >libopenaes.so
# cp -f libopenaes.so  libs/armeabi/libopenaes.so

if [[ $is_gradle -gt 0 ]]; then
    # gradle 
    gradle clean assembleRelease
    signed_apk="build/outputs/apk/spollo-release-unsigned.apk"
else
    # ant
    ant clean release
    signed_apk="bin/Spollo-release-unsigned.apk"
fi

# sign apk
jarsigner -digestalg SHA1 -sigalg MD5withRSA -keystore release.ks -storepass uccloud20130801 -keypass uccloud20130801 -signedjar Spollo.apk $signed_apk cloudtest.keystore