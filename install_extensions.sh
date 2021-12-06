#!/bin/bash

function wget_inst() {

        ex_tool="$1"
        ex_link="$2"

	wget ${ex_link}
	mv ${ex_tool} ./vsix_list/${ex_tool}
       	code-server --install-extension ./vsix_list/${ex_tool}

	sudo systemctl restart code-server@ubuntu.service
}

while :
do
	echo " Choose the extension you want to install. If not, press 0"
	cat ./extension_list.txt
	read ex_num

	if [ ${ex_num} -eq '1' ] ; then

		sudo apt-get install build-essential
		sudo apt-get install gdb

        	wget_inst $"cpptools-linux.vsix" $"https://github.com/microsoft/vscode-cpptools/releases/download/1.7.1/cpptools-linux.vsix"

	elif [ ${ex_num} -eq '2' ] ; then

        	jdk_tools=jdk-17_linux-x64_bin.tar.gz
        	sudo wget -P /opt/ https://download.oracle.com/java/17/latest/${jdk_tools}

        	sudo tar xvzf /opt/${jdk_tools} -C /opt/

		if [ $(grep "#JAVA#" ~/.bashrc) ]; then

			echo "Environment variables are already set"

		else

        		echo "#JAVA#" >> ~/.bashrc
        		echo "export JAVA_HOME=/opt/jdk-17.0.1" >> ~/.bashrc
        		echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc

	        	source ~/.bashrc
		fi

        	wget_inst $"redhat.java-1.1.0.vsix" $"https://github.com/redhat-developer/vscode-java/releases/download/v1.1.0/redhat.java-1.1.0.vsix"
        	wget_inst $"vscjava.vscode-java-debug-0.37.0.vsix" $"https://github.com/microsoft/vscode-java-debug/releases/download/0.37.0/vscjava.vscode-java-debug-0.37.0.vsix"
		wget_inst $"vscjava.vscode-java-test-0.22.3.vsix" $"https://github.com/microsoft/vscode-java-test/releases/download/0.22.3/vscjava.vscode-java-test-0.22.3.vsix"
        	wget_inst $"vscjava.vscode-maven-0.34.1.vsix" $"https://open-vsx.org/api/vscjava/vscode-maven/0.34.1/file/vscjava.vscode-maven-0.34.1.vsix"
        	wget_inst $"vscjava.vscode-java-dependency-0.18.8.vsix" $"https://github.com/microsoft/vscode-java-dependency/releases/download/0.18.8/vscjava.vscode-java-dependency-0.18.8.vsix"

	elif [ ${ex_num} -eq '3' ] ; then

		wget_inst $"ms-python-release.vsix" $"https://github.com/microsoft/vscode-python/releases/download/2020.3.71659/ms-python-release.vsix"

	elif [ ${ex_num} -eq '0' ] ; then

		break

	else

	   	echo "enter right integer"
	fi
done
