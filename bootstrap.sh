#!/usr/bin/env bash

echo "Actualizando el Repositorio:..."
apt-get update

echo "Instalando el Servidor Web:..."
# Install Apache
#apt-get install apache2 -y
#Install PHP
#sudo apt-get -y install php5 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-mysql php-apc php5-xsl -y > /dev/null 2>&1

echo "Instalando MySql:..."
# Install MySQL
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
apt-get install mysql-client mysql-server -y
apt-get install python3-mysqldb
apt-get install python3-mysql.connector


echo "Instalando Django y Python3:..."
apt-get install python3-pip
apt-get install python3-dev
apt-get install python3-dev libmysqlclient-dev
pip3 install Django
pip3 install virtualenv
pip3 install mysqlclient


echo "Instalando OpenJDK 9:..."
sudo apt-get install openjdk-9-jre

echo "Instalando Aplicaciones Generales:..."
apt-get install curl git -y  > /dev/null 2>&1


######################### Restart services #########################

service apache2 restart
service mysql restart
