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
        wget https://vip.d0.baidupan.com/file/?AWdQbl1sV2YJAAI6BDFTP1FuBz8EMVcxC2dXfAFlUSUJOwdmDGAPdgI4BToFPwJ2AyEOJlNtCnpRO1VlBW1TfwF3UGFdcFcuCTcCMgQ8UyZRJQd2BDpXJwsiVzYBJ1F2CW8HOQw9Dz4CCwU6BTUCPgNqDjtTPQo/UWNVYwVvU2IBJ1BhXXNXPgloAmcEZ1NjUToHNQRpV2ALKlchAS1RbQk7B2AMYw9rAnsFYwVoAiwDaw49UyMKP1E0VWcFa1NqATVQNl00VzEJagJtBDJTYVEzBzoEbFcxC25XNQE4UTMJaAdhDGIPYgIxBWMFYAJmA20OOlNuCiZRMVUpBX9TJwFyUGJdcldqCTsCaQRhU2RRPgc7BGNXZws4V3cBKVE5CWQHNQw3D2YCZQVlBWECMgNpDjJTOwo+UWBVZAV3U3QBdFB3XT1XMglxAnIENlM+UXwHPwRrV3MLeVchASpRbQk4B2YMYQ9qAmQFagVnAjYDbg4yUyoKfVE/VSMFZFNjATNQNF0uVzIJagJmBH5TY1EyBzAEdVdnCzhXZA==
    else
        wget https://vip.d0.baidupan.com/file/?BmAAPlprUmMFDAoyV2IAbFRrDzcANVE3VTlbcFA0UCQHNQJjXDBTKgI4VGtUbgF1VnQGLlVrUSFXPVpvVDpRfQZwADFad1IrBTsKOldvAHVUIA9+AD5RIVV8WzpQdlB3B2ECPFxtU2ICC1RrVGQBPVY/BjNVO1FkV2VabFQ+UWkGIAAxWnRSOwVkCmpXOgA3VDgPPQBuUWFVdFstUHxQbAc1AmVcM1M3AntUMlQ5AS9WPgY1VSVRMVczWmhUPFE2BjYAb1owUj4FMgpkVzUAZ1Q6D2kAPFFgVWpba1A1UGUHMQJlXDVTYQJmVDdUNwEzVjQGYFU5UX1XN1omVC5RJQZ1ADJadVJvBTcKYVcyADdUOw8zAGdRYVVmW3tQeFA4B2oCMFxnUzoCZVQ0VDABMVY8BjpVPVFkV2JaalQmUXYGcwAnWjpSNwV9CnpXZQBtVHkPNwBvUXVVJ1stUHtQbAc2AmNcMVM2AmRUO1Q2ATZWPAYwVSxRJlc5WixUNVFhBjQAZFopUjcFZgpuVy0AMFQ3DzgAcVFhVWZbaA==
    fi
fi

# download optifine
echo Setup 5/10
if [ ! -f OptiFine_1.14.4_HD_U_F5.jar ]; then
    wget https://optifine.net/downloadx?f=OptiFine_1.14.4_HD_U_F5.jar&x=71d50bb647c2f81a98e4497c1af756e9
fi

# download lwjgl3arm64
echo Setup 6/10
if [ ! -f lwjgl3*.tar.gz ]; then
    if[$a = 64]; then
        wget https://vip.d0.baidupan.com/file/?UjRSbAg5Dz4CC1FpBjNUOAY5UGgHNAJ3Am8BYFNjUWMAYVN2CTkBY1IwVi4CIgBgBi4BKgU9VCwFJFExATQEaVI3UloIPA8/AmlRNAZiVGQGa1BgB2ECMgI2ASFTaVEjAD1TNwliAWxSN1Y5AmQANQZ6AXQFKlRrBTBRZwFvBDVSfVI1CGwPdAJmUTEGfVQ3BjpQMQc6AjMCNQE1UzpRYABlU2IJYQFgUjFWZQI0AGIGawFmBW5UbgVjUTEBbARjUmpSNQhkD28CYlExBjdUewY7UC8HfgJ1AnYBYlN9UTkAZFM5CWUBY1IxVjkCbgAzBmgBIgUuVD8Fb1EyATsEOFJjUjMIZQ9qAmRRPgZqVGIGaFBjB3YCJgJwAXdTMlFhAC5TIgkyATlSc1Y9AmYAJwYpAXQFLVRrBTNRYQFtBDRSYlI8CGIPbAJmUTYGdFQgBjVQJQdlAjECNwE0UyFRYQA1UzYJegFkUj1WMgJ4ADMGaAEx
    else
        wget https://vip.d0.baidupan.com/file/?UjQCPAw9Dz4BCFBoAzZcMAQ7BT0DMFEkCmdWN1VlVWcBLwUmCzcBJ1EpCzpQflF2VGgHawAzAGcDW1Q7VGwBPVJhAmUMYA9sAWJQPwNlXGQEeAVmAy9Rbgo+VmJVPlVlATAFYAthAXNRdwstUDlRYlQ+BzAAbwAtAzRUa1QnATJSZAJ6DDAPbQExUDUDYVxrBGgFZgM9UWMKaFZjVT9VYwEyBWoLbwFsUTcLalBmUTFUPAcwADsAMgM2VDFUaQFjUmECZgx/DzwBLVAgAyJcLgQ7BXIDNVE3CjBWYVU/VWEBOAVqC2QBYVEhCylQbVE9VGsHZABiADMDMlRiVDkBMFJrAm0MZg9iAWRQKANxXCgELgU9A21RfQorVjZVZVUjATwFYgtwASBRdwsqUDlRYVQ4BzIAbgAyAz1UZVQ/ATJSZwJzDCQPMgEnUDsDZlxvBG0FLgNtUWYKP1Z+VThVbQEzBXwLZAFhUTI=
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

echo "接下来的操作请看我的GitHub：,run on 5s later."
sleep 5s
./opt/jdk/jdk1.8.0_261/bin/java -jar launcher.jar

echo end setupMC1_14_4
