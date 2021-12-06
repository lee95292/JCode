## 0.Ensure that active user is Ubuntu and JCode repo is updated

#cd /home/Ubuntu/JCode
#git fetch

## 1.Install code-server (latest release)

curl -fsSL https://code-server.dev/install.sh | sh

# Register and start the code-server daemon
sudo systemctl enable --now code-server@$USER

echo "Waiting for creating config.yaml..."
while [ ! -f ~/.config/code-server/config.yaml ];
do
	sleep 0.1
done
echo "Done!"

# renew the password in the configuration file
cp ./code-server/config.yaml ~/.config/code-server/

num=`expr $RANDOM % 10000`
num=$(seq -f "%04g" $num $num)
#echo $num	#do not show the password
sed -i "s/password:.*/password: $num/" ~/.config/code-server/config.yaml

# Install extensions for code-server


# Restart code-server daemon
sudo systemctl restart code-server@ubuntu.service

## 2.Install Watcher-client

sudo mkdir /usr/lib/watcher/
sudo cp ./watcher/watch.sh /usr/lib/watcher/
sudo cp ./watcher/client /usr/lib/watcher/
sudo cp ./watcher/watcher.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable watcher.service

## 3.Reset the cloud-init
sudo rm -rf /var/lib/cloud/instances/*/sem/config_scripts_user
rm /home/ubuntu/.bash_history
#sudo rm /root/.bash_history	#no need to execute. no file

## 4.Install Extension
./install_jota_agent.sh
