#!/bin/sh -e

$a=`getconf LONG_BIT`

echo begin setupMC1_14_4

DIR=~/Minecraft

# create folders
echo Setup 1/10
if [ ! -d "$DIR" ]; then
    mkdir "$DIR"
fi
cd "$DIR"
pwd

echo Setup 2/10
if [ ! -d ~/lwjgl3arm ]; then
    mkdir ~/lwjgl3arm
fi

# download minecraft
echo Setup 3/10
if [ ! -f launcher.jar ]; then
    wget http://move.rupy.se/file/launcher.jar
fi

# download java  
echo Setup 4/10
if [ ! -f jdk-*.tar.gz ]; then
    if[$a = 64]; then
        wget 
    else
        wget 
    fi
fi

# download optifine
echo Setup 5/10
if [ ! -f OptiFine_1.14.4_HD_U_F3.jar ]; then
    wget https://www.dropbox.com/s/n3glkneqf7dpj3g/OptiFine_1.14.4_HD_U_F3.jar
fi

# download lwjgl3arm64
echo Setup 6/10
if [ ! -f lwjgl3arm64.tar.gz ]; then
    wget https://www.dropbox.com/s/0x765uoy6ihj3gr/lwjgl3arm64.tar.gz
fi

echo Setup 7/10
if [ ! -d /opt/jdk ]; then
    sudo mkdir /opt/jdk
fi

# extract oracle java  8
echo Setup 8/10
echo Extracting java ...
sudo tar -zxf jdk-8u221-linux-arm64-vfp-hflt.tar.gz -C /opt/jdk

# extract lwjgl3arm64
echo Setup 9/10
echo Extracting lwjgl3arm64 ...
tar -zxf lwjgl3arm64.tar.gz -C ~/lwjgl3arm64

# get run script
echo Setup 10/10
sudo chmod +x runMC1_14_4_OptifineF3.sh  

echo end setupMC1_14_4
