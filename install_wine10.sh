#######install wine on windows 10##########
sudo dpkg --add-architecture i386
sudo apt update
sudo apt -y upgrade
sudo apt install -y wine-stable wget
echo export 'DISPLAY=:0.0' >> ~/.bashrc
source ~/.bashrc

#install and eject https://sourceforge.net/projects/vcxsrv/ which is a nicely packaged version of XOrg compiled for Windows — just grab the latest .exe and run it to install it. Start the X server from the Start button with "XLaunch". It'll take you through defaults — leave most of them as-is. I ticked "Disable access control" just in case. Save your configuration.
wget https://razaoinfo.dl.sourceforge.net/project/vcxsrv/vcxsrv/1.20.14.0/vcxsrv-64.1.20.14.0.installer.exe
explorer.exe vcxsrv-64.1.20.14.0.installer.exe

sudo apt install -y gcc-multilib
sudo apt install -y qemu-user-static
sudo update-binfmts --install i386 /usr/bin/qemu-i386-static --magic '\x7fELF\x01\x01\x01\x03\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x03\x00\x01\x00\x00\x00' --mask '\xff\xff\xff\xff\xff\xff\xff\xfc\xff\xff\xff\xff\xff\xff\xff\xff\xf8\xff\xff\xff\xff\xff\xff\xff'

#reload binfmt:
sudo service binfmt-support start
rm -r ~/.wine
#env WINEPREFIX=win32
winecfg
