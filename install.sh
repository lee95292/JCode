## 0.Ensure that active user is Ubuntu and JCode repo is updated

#cd /home/Ubuntu/JCode
#git fetch

## 1.Install code-server (latest release)

curl -fsSL https://code-server.dev/install.sh | sh
cp ./code-server/config.yaml ~/.config/code-server

# renew the password in the configuration file
num=`expr $RANDOM % 10000`
echo $num
sed -e "s/password:.*/password: $num/" ~/.config/code-server/config.yaml

# Install extensions for code-server

# Register and start the code-server daemon
sudo systemctl enable --now code-server@ubuntu

## 2.Install Watcher-client

sudo mkdir /usr/lib/watcher/
sudo cp ./watcher/watch.sh /usr/lib/watcher/
sudo cp ./watcher/client /usr/lib/watcher/
sudo cp ./watcher/watcher.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable watcher.service

## 3.Reset the cloud-init
rm /var/lib/cloud/instances/*/sem/config_scripts_user
rm /home/ubuntu/.bash_history
sudo rm /root/.bash_history

