#*/bin/bash
LOG=/tmp/log.sh
echo "Downloading Tomcat"
cd /opt/
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz -O /opt/apache-tomcat-9.0.56.tar.gz &>>$LOG
if [ $? -ne 0 ];then
    echo "Downloading ......Failed"
    exit 1
else
    echo "Downloading ......Success"
fi
echo "Extracting Tomcat"
tar -xvf apache-tomcat-9.0.56.tar.gz &>>$LOG
if [ $? -ne 0 ];then
    echo "Extracting ......Failed"
    exit 1
else
    echo "Extracting ......Success"
fi
echo "Download and Deploying WAR Package"
cd /opt/apache-tomcat-9.0.56/webapps
wget https://github.com/Chinnusree23/Central-Repo/raw/main/registeruser.war -O /opt/apache-tomcat-9.0.56/webapps/registeruser.war &>>$LOG
if [ $? -ne 0 ];then
    echo "Download and Deploy ......Failed"
    exit 1
else
    echo "Download and Deploy ......Success"
fi
cd /opt/apache-tomcat-9.0.56/bin
sh shutdown.sh &>>$LOG
echo "Tomcat Shuts Down"
sh startup.sh &>>$LOG
echo "Tomcat Started"