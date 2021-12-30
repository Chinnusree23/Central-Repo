#*/bin/bash
LOG=/tmp/log.sh
TOM_URL=https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
TOM_TAR=apache-tomcat-9.0.56.tar.gz
TOM_DIR=apache-tomcat-9.0.56
WAR_URL=https://github.com/Chinnusree23/Central-Repo/raw/main/registeruser.war
VAL(){
if [ $1 -ne 0 ];then
    echo "$2 ......Failed"
    exit 1
else
    echo "$2 ......Success"
fi    
}

echo "Downloading Tomcat"
cd /opt/
wget $TOM_URL -O /opt/$TOM_TAR &>>$LOG
VAL $? "Downloading"

echo "Extracting Tomcat"
tar -xvf $TOM_TAR &>>$LOG
VAL $? "Extracting"

echo "Download and Deploying WAR Package"
cd /opt/$TOM_DIR/webapps
wget $WAR_URL -O /opt/$TOM_DIR/webapps/registeruser.war &>>$LOG
VAL $? "Download and Deploying"

cd /opt/$TOM_DIR/bin
sh shutdown.sh &>>$LOG
echo "Tomcat Shuts Down"
sh startup.sh &>>$LOG
echo "Tomcat Started"