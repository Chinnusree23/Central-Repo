#*/bin/bash
LOG=/tmp/log.sh
TOM_URL=https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
TOM_TAR=apache-tomcat-9.0.56.tar.gz
TOM_DIR=apache-tomcat-9.0.56
WAR_URL=https://github.com/Chinnusree23/Central-Repo/raw/main/registeruser.war
echo "Downloading Tomcat"
cd /opt/
wget $TOM_URL -O /opt/$TOM_TAR &>>$LOG
if [ $? -ne 0 ];then
    echo "Downloading ......Failed"
    exit 1
else
    echo "Downloading ......Success"
fi
echo "Extracting Tomcat"
tar -xvf $TOM_TAR &>>$LOG
if [ $? -ne 0 ];then
    echo "Extracting ......Failed"
    exit 1
else
    echo "Extracting ......Success"
fi
echo "Download and Deploying WAR Package"
cd /opt/$TOM_DIR/webapps
wget $WAR_URL -O /opt/$TOM_DIR/webapps/registeruser.war &>>$LOG
if [ $? -ne 0 ];then
    echo "Download and Deploy ......Failed"
    exit 1
else
    echo "Download and Deploy ......Success"
fi
cd /opt/$TOM_DIR/bin
sh shutdown.sh &>>$LOG
echo "Tomcat Shuts Down"
sh startup.sh &>>$LOG
echo "Tomcat Started"