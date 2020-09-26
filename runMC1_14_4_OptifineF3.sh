#!/bin/sh

#
# script to run minecraft on ARM linux.  for reference:
#
#   http://rogerallen.github.io/jetson/2014/07/31/minecraft-on-jetson-tk1/
#   https://devtalk.nvidia.com/default/topic/764821/embedded-systems/minecraft-on-the-jetson-tk1/
#   https://gist.github.com/rogerallen/91526c9c8be1a82881e0
#
 
# !!! YOU MUST PERSONALIZE ALL OF THIS INFO !!!
# your personal login/password.  chmod 700 to keep this private
MINECRAFT_LOGIN=3422857988@qq.com
MINECRAFT_USERNAME=zhongbai233
MINECRAFT_PASSWORD=tujiaxuan5432

# where did you store the native liblwjgl.so and libopenal.so?
MINECRAFT_NATIVE_PATH=/home/steve/lwjgl3arm64/
# info from initial run data in .minecraft/launcher_profiles.json
MINECRAFT_CLIENTTOKEN=b61fb8e9-97bf-435f-8354-1feaba0ce734
MINECRAFT_UUID=c44a2777-cf18-42cb-89c8-0572c8495065
MINECRAFT_VERSION=1.14

TWEAK_CLASS=optifine.OptiFineTweaker

MINECRAFT_ATOKEN="$(\
curl -i \
  -H "Accept:application/json" \
  -H "content-Type:application/json" \
  https://authserver.mojang.com/authenticate \
  -X POST \
  --data '{"agent": {"name": "Minecraft","version": 1}, "username": "'$MINECRAFT_LOGIN'", "password": "'$MINECRAFT_PASSWORD'",  "clientToken": "'$MINECRAFT_CLIENTTOKEN'" }' \
  | sed '/accessToken":"/!d;s//&\n/;s/.*\n//;:a;/",/bb;$!{n;ba};:b;s//\n&/;P;D' \
)"
# '

echo "todays access token = "$MINECRAFT_ATOKEN

MINECRAFT_UUID="$(\
curl -X POST -H 'Content-Type: application/json' https://api.mojang.com/profiles/minecraft --data '"'$MINECRAFT_USERNAME'"' \
| sed '/id":"/!d;s//&\n/;s/.*\n//;:a;/",/bb;$!{n;ba};:b;s//\n&/;P;D' \
)"

echo "MINECRAFT_UUID="$MINECRAFT_UUID

/opt/jdk/jdk1.8.0_221/bin/java -Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseAdaptiveSizePolicy -Xmn128M -Djava.library.path=/home/steve/lwjgl3arm64 -Dminecraft.launcher.brand=java-minecraft-launcher -Dminecraft.launcher.version=1.6.89-j -cp /home/steve/.minecraft/libraries/optifine/OptiFine/1.14.4_HD_U_F3/OptiFine-1.14.4_HD_U_F3.jar:/home/steve/.minecraft/libraries/optifine/launchwrapper-of/2.1/launchwrapper-of-2.1.jar:/home/steve/.minecraft/libraries/com/mojang/patchy/1.1/patchy-1.1.jar:/home/steve/.minecraft/libraries/oshi-project/oshi-core/1.1/oshi-core-1.1.jar:/home/steve/.minecraft/libraries/net/java/dev/jna/jna/4.4.0/jna-4.4.0.jar:/home/steve/.minecraft/libraries/net/java/dev/jna/platform/3.4.0/platform-3.4.0.jar:/home/steve/.minecraft/libraries/com/ibm/icu/icu4j-core-mojang/51.2/icu4j-core-mojang-51.2.jar:/home/steve/.minecraft/libraries/com/mojang/javabridge/1.0.22/javabridge-1.0.22.jar:/home/steve/.minecraft/libraries/net/sf/jopt-simple/jopt-simple/5.0.3/jopt-simple-5.0.3.jar:/home/steve/.minecraft/libraries/io/netty/netty-all/4.1.25.Final/netty-all-4.1.25.Final.jar:/home/steve/.minecraft/libraries/com/google/guava/guava/21.0/guava-21.0.jar:/home/steve/.minecraft/libraries/org/apache/commons/commons-lang3/3.5/commons-lang3-3.5.jar:/home/steve/.minecraft/libraries/commons-io/commons-io/2.5/commons-io-2.5.jar:/home/steve/.minecraft/libraries/commons-codec/commons-codec/1.10/commons-codec-1.10.jar:/home/steve/.minecraft/libraries/net/java/jinput/jinput/2.0.5/jinput-2.0.5.jar:/home/steve/.minecraft/libraries/net/java/jutils/jutils/1.0.0/jutils-1.0.0.jar:/home/steve/.minecraft/libraries/com/mojang/brigadier/1.0.17/brigadier-1.0.17.jar:/home/steve/.minecraft/libraries/com/mojang/datafixerupper/2.0.24/datafixerupper-2.0.24.jar:/home/steve/.minecraft/libraries/com/google/code/gson/gson/2.8.0/gson-2.8.0.jar:/home/steve/.minecraft/libraries/com/mojang/authlib/1.5.25/authlib-1.5.25.jar:/home/steve/.minecraft/libraries/org/apache/commons/commons-compress/1.8.1/commons-compress-1.8.1.jar:/home/steve/.minecraft/libraries/org/apache/httpcomponents/httpclient/4.3.3/httpclient-4.3.3.jar:/home/steve/.minecraft/libraries/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar:/home/steve/.minecraft/libraries/org/apache/httpcomponents/httpcore/4.3.2/httpcore-4.3.2.jar:/home/steve/.minecraft/libraries/it/unimi/dsi/fastutil/8.2.1/fastutil-8.2.1.jar:/home/steve/.minecraft/libraries/org/apache/logging/log4j/log4j-api/2.8.1/log4j-api-2.8.1.jar:/home/steve/.minecraft/libraries/org/apache/logging/log4j/log4j-core/2.8.1/log4j-core-2.8.1.jar:/home/steve/lwjgl3arm64/lwjgl-glfw.jar:/home/steve/lwjgl3arm64/lwjgl-jemalloc.jar:/home/steve/lwjgl3arm64/lwjgl-openal.jar:/home/steve/lwjgl3arm64/lwjgl-opengl.jar:/home/steve/lwjgl3arm64/lwjgl-stb.jar:/home/steve/lwjgl3arm64/lwjgl.jar:/home/steve/lwjgl3arm64/libjemalloc.so:/home/steve/lwjgl3arm64/libopenal.so:/home/steve/lwjgl3arm64/liblwjgl_opengl.so:/home/steve/lwjgl3arm64/libglfw.so:/home/steve/lwjgl3arm64/liblwjgl_stb.so:/home/steve/lwjgl3arm64/liblwjgl.so:/home/steve/lwjgl3arm64/lwjgl-jemalloc-natives-linux-arm64.jar:/home/steve/Downloads/lwjgl-openal-natives-linux-arm64.jar:/home/steve/lwjgl3arm64/lwjgl-opengl-natives-linux-arm64.jar:/home/steve/Downloads/lwjgl-glfw-natives-linux-arm64.jar:/home/steve/Downloads/lwjgl-stb-natives-linux-arm64.jar:/home/steve/lwjgl3arm64/lwjgl-natives-linux-arm64.jar:/home/steve/.minecraft/libraries/com/mojang/text2speech/1.11.3/text2speech-1.11.3.jar:/home/steve/.minecraft/versions/1.14.4-OptiFine_HD_U_F3/1.14.4-OptiFine_HD_U_F3.jar net.minecraft.launchwrapper.Launch \
--username $MINECRAFT_USERNAME \
    --accessToken "$MINECRAFT_ATOKEN" \
    --uuid "$MINECRAFT_UUID" \
    --version $MINECRAFT_VERSION \
    --userProperties {} \
    --gameDir ~/.minecraft \
    --assetsDir ~/.minecraft/assets \
    --assetIndex $MINECRAFT_VERSION \
    --tweakClass $TWEAK_CLASS	    