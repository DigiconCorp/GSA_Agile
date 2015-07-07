FROM ubuntu:trusty
MAINTAINER Adam Chapman <adam.p.chapman@gmail.com>
EXPOSE 8888
# base packages
RUN apt-get update -y && apt-get install -y wget unzip xsltproc tar
RUN wget -O install.sh https://raw.githubusercontent.com/DigiconCorp/GSA_Agile/master/src/install.sh 
RUN chmod 775 install.sh 
RUN ./install.sh


