echo "[provision] Installing Oracle-java7..."
add-apt-repository ppa:webupd8team/java
apt-get update
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java7-installer
apt-get install -y oracle-java7-set-default
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/
export PATH=$JAVA_HOME/bin:$PATH
echo "[provision] Installing Talend MDM Server"
java -jar /vagrant/TOS_MDM-Server-20141207_1530-V5.6.1.jar /vagrant/config/mdm_installer_config.xml

# fix "unable to connect from Studio" issue (https://jira.talendforge.org/browse/TMDM-8285)
cp /vagrant/config/jboss-beans.xml /home/vagrant/talend-mdm-server/jboss-4.2.2.GA/server/default/deploy/jbossws.sar/jbossws.beans/META-INF/jboss-beans.xml

echo "[provision] Starting Talend MDM Server"
cd /home/vagrant/talend-mdm-server/jboss-4.2.2.GA/
sudo nohup ./run.sh 0<&- &>/dev/null &
