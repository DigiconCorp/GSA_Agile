
<strong>Demo URL:http://66.23.117.40/demo/</strong>


#Demo install 
<strong>Requirments</strong>
<p>Below are a list of requirements that are neede in order to install and run the demo applicaion. </p>
1. Railo-4.2.1.008 - This application uses the Railo application server. Optionally it can be download from http://www.getrailo.org/index.cfm/download/ however the install.sh will automatically download detect if the file is missing and download it if necessary.
<br>
2. Ubuntu 14.04.1 - Install has been tested on this version but will may work on other versions of Ubuntu.
 <br>
3. ssh access to the Ubuntu Server that has root privilages.
4. Inbound Port 8888 open<br>
5. The Ubuntu server will need to be able to access the internet to download files for the installation.
<br>

<br>
<strong>To install the application, ssh login to your Ubuntu Server and run the following commands. The install script will download all necessary files from this repository and install the application and the railo server.</strong>
<br>
sudo wget -O install.sh https://raw.githubusercontent.com/DigiconCorp/GSA_Agile/master/src/install.sh
<br>
sudo chmod 775 install.sh
<br>
sudo ./install.sh
<br>
<br>To access the system, use a web browser and access http://your_server_ip_or_dns:8888 or http://localhost:8888. For example if your server's ip address is 192.168.1.10 then you would go to  http://192.168.1.10:8888 

