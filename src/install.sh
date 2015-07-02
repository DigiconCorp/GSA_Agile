#!/bin/sh
echo "Installing tools"
sudo apt-get install wget zip unzip
sudo apt-get install zip 
sudo apt-get install unzip
if [ ! -f "railo-4.2.1.008-pl0-linux-x64-installer.run" ]
then
sudo wget -O railo-4.2.1.008-pl0-linux-x64-installer.run http://www.getrailo.org/railo/remote/download42/4.2.1.008/tomcat/linux/railo-4.2.1.008-pl0-linux-x64-installer.run

fi
sudo chmod 775 railo-4.2.1.008-pl0-linux-x64-installer.run

if [ ! -f "Demo-master.zip" ]
then
	sudo wget -O Demo-master.zip  https://github.com/DigiconCorp/GSA_Agile/archive/master.zip
fi
sudo unzip -o Demo-master.zip  -d ./tmp
sudo chmod 775 /tmp -R
sudo cp -r ./tmp/GSA_Agile-master/src/railoinstall.txt ./
sudo cp -r ./tmp/GSA_Agile-master/src/uninstall.sh ./

sudo chmod 775 railoinstall.txt
sudo chmod 775 uninstall.sh
echo "==================="
echo "  Installing Railo "
echo "  Please Wait!! - This may take several minutes"
echo "==================="
sudo ./railo-4.2.1.008-pl0-linux-x64-installer.run --mode unattended --optionfile railoinstall.txt
sudo chmod 775 /opt/railo/ -R

echo "Installing Demo-master "
sudo cp -r ./tmp/Demo-master/src/wwwroot/* /opt/railo/tomcat/webapps/ROOT/
# sudo rm ./tmp -R
echo "==================="
echo "  Install Complete "
echo "Access http://localhost:8888/ to view the application"
echo "==================="
sudo chmod 775 Demo-master.zip
