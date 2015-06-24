#!/bin/sh
sudo rm ./Demo-master.zip
sudo rm ./railoinstall.txt
sudo rm ./railo-4.2.1.008-pl0-linux-x64-installer.run
sudo rm ./install.sh
sudo rm ./uninstall.sh
cd /opt/railo/
sudo ./uninstall
cd /opt
sudo rm railo -R
echo "Finished"
