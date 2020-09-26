#!/bin/sh -e

a=`getconf LONG_BIT`

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
        wget https://dev05.baidupan.com/092618bb/2020/09/26/7b428414259b3887dbdeca139e01e41b.gz?st=iSFZE14_lETJJBMlzbVrfQ&e=1601116872&b=BT0LbwBrVX0Dbl98BWcBMwRgWyoNYARrVWgKcgJ9X3BUZwl7Uz4AM1MyUyhWcFAyCSxaK1c_bAWECPQF4XXRTJQU2C3kALlU3Ayw_c&fi=30175060&pid=123-152-192-245&up=
    else
        wget https://dev95.baidupan.com/092618bb/2020/09/26/bc44f0878a86f4cc38694604f25738c3.gz?st=JQl4GNbiiYKbYZGC1wGWLw&e=1601116728&b=UmoJbVM4UXlVOFV2AWNVZ1UxWShTPlA_aAD1aIgF_bUX4BMgx_bBWhTZVcwA3gKLAdlASQMfQ1kB2cCPVghBy5RJ1JhCXtTfVEzVXo_c&fi=30175069&pid=123-152-192-245&up=
    fi
fi

# download optifine
echo Setup 5/10
if [ ! -f OptiFine_1.14.4_HD_U_F5.jar ]; then
    wget https://optifine.net/adloadx?f=OptiFine_1.14.4_HD_U_F5.jar
    sed -n '/downloadx?f=OptiFine_1.14.4_HD_U_F5.jar/,/ /p' 'adloadx?f=OptiFine_1.14.4_HD_U_F5.jar' > 1.log
    cut -d '&' -f 2 1.log | cut -d "'" -f 1 > 2.log
    optifine=`sed -n '1p' 2.log`
    rm 'adloadx?f=OptiFine_1.14.4_HD_U_F5.jar'
    rm 1.log
    rm 2.log
    wget "https://optifine.net/downloadx?f=OptiFine_1.14.4_HD_U_F5.jar&$optifine" -O ./OptiFine_1.14.4_HD_U_F5.jar
fi

# download lwjgl3arm64
echo Setup 6/10
if [ ! -f lwjgl3*.tar.gz ]; then
    if[$a = 64]; then
        wget https://dev34.baidupan.com/092618bb/2020/09/26/bfdb30250ef555ebc7b48af1f801466e.gz?st=8QXuJVJBE-Qstw_Ub9EFzw&e=1601116662&b=VGoKfQhiUjBUbV86VWRSJFZuWzEBNAsjAiUIZAB1BSkHMl4k&fi=30175923&pid=123-152-192-245&up=
    else
        wget https://dev95.baidupan.com/092618bb/2020/09/26/a6f3666fa0e367389907ba22d02cac33.gz?st=dgUe9zclEy3Yre5bT39i0g&e=1601116507&b=AjxbLAljBGYFPF47BngOfgczDCIDLAprUXg_c&fi=30175929&pid=123-152-192-245&up=
    fi
fi

echo Setup 7/10
if [ ! -d /opt/jdk ]; then
    sudo mkdir /opt/jdk
fi

# extract oracle java  8
echo Setup 8/10
echo Extracting java ...
sudo tar -zxf jdk-*.tar.gz -C /opt/jdk

# extract lwjgl3arm64
echo Setup 9/10
echo Extracting lwjgl3arm ...
tar -zxf lwjgl3arm*.tar.gz -C ~/lwjgl3arm

# get run script
echo Setup 10/10

sudo chmod +x runMC1_14_4_OptifineF3.sh  

echo "接下来的操作请看我的GitHub：https://github.com/zhongbai2333/Minecraft-ARM ,run on 5s later."
sleep 5s
./opt/jdk/jdk1.8.0_261/bin/java -jar launcher.jar

echo end setupMC1_14_4
