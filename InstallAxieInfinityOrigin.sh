#!/bin/bash

instdir="$1"
if [ $1 = $2 ]
then
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "Without any arguments, it will install in ~/.WineApps/"
echo "If you want to install it in another dir use the script that way :"
echo " "
echo "'Scriptfile /path/to/dir/'"
echo " "
echo "If you want to change the directory, you have 5 seconds to cancel with CTRL + C"
sleep 5
mkdir ~/.WineApps
instdir=$HOME/.WineApps 
fi

echo "Perparing Prefix..."

mkdir $instdir/AxieInfinity/

WINEPREFIX=$instdir/AxieInfinity wineboot

wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks

WINEPREFIX=$instdir/AxieInfinity ./winetricks dxvk vkd3d

rm winetricks

echo "Downloading Axie Infinity Origins..."

wget https://lulucloud.mywire.org/FileHosting/GithubProjects/AxieInfinityOrigin/AxieInfinity-Origins.tar.xz -O /tmp/AxieInfinity-Origins.tar.xz

tar -xf /tmp/AxieInfinity-Origins.tar.xz -C /tmp/

cp -r /tmp/Axie\ Infinity\ -\ Origins $instdir/AxieInfinity/drive_c/Program\ Files/
rm -rf /tmp/Axie\ Infinity\ -\ Origins 

touch $instdir/AxieInfinity/drive_c/launcher.sh
echo 'export WINEPREFIX="'$instdir'/AxieInfinity"' >> $instdir/AxieInfinity/drive_c/launcher.sh
echo 'WINEPREFIX='$instdir'/AxieInfinity DXVK_LOG_PATH='$instdir'/AxieInfinity DXVK_STATE_CACHE_PATH='$instdir'/AxieInfinity wine' $instdir'/AxieInfinity/drive_c/Program\ Files/Axie\ Infinity\ -\ Origins/AxieInfinity-Origins.exe $FILE_PATH' >> $instdir/AxieInfinity/drive_c/launcher.sh

chmod +x $instdir/AxieInfinity/drive_c/launcher.sh

rm ~/.local/share/icons/axieinfinityorigin.png

rm ~/.local/share/applications/axieinfinityorigin.desktop

wget https://lulucloud.mywire.org/FileHosting/GithubProjects/AxieInfinityOrigin/axieinfinityorigin.png -O ~/.local/share/icons/axieinfinityorigin.png

touch ~/.local/share/applications/axieinfinityorigin.desktop
echo '[Desktop Entry]' >> ~/.local/share/applications/axieinfinityorigin.desktop
echo 'Name=Axie Infinity Origins' >> ~/.local/share/applications/axieinfinityorigin.desktop
echo 'Exec=bash -c "'$instdir'/AxieInfinity/drive_c/launcher.sh %F"' >> ~/.local/share/applications/axieinfinityorigin.desktop
echo 'Type=Application' >> ~/.local/share/applications/axieinfinityorigin.desktop
echo 'Comment=Axie Infinity Origin (Wine)' >> ~/.local/share/applications/axieinfinityorigin.desktop
echo 'Categories=Games;' >> ~/.local/share/applications/axieinfinityorigin.desktop
echo 'Icon=axieinfinityorigin' >> ~/.local/share/applications/axieinfinityorigin.desktop
echo 'StartupWMClass=axieinfinity-origins.exe' >> ~/.local/share/applications/axieinfinityorigin.desktop

echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "Axie Infinity Origins installed, you can close this window"
