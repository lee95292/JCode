#!/bin/bash
https://github.com/microsoft/vscode-java-test/releases/download/0.22.3/vscjava.vscode-java-test-0.22.3.vsix
ex_path=~/.local/share/code-server/extensions/

function wget_inst() {
        ex_tool="$1"
        ex_link="$2"
	wget -P ${ex_path}/ ${ex_link}
       	code-server --install-extension ${ex_path}/${ex_tool}

	sudo systemctl restart code-server@ubuntu.service
}

echo " Choose the extension you want to install. If not, press 0 "
cat extension_list.txt
read ex_num

ex_path=~/.local/share/code-server/extensions
if [ ${ex_num} -eq '1' ] ; then

        wget_inst $"cpptools-linux.vsix" $"https://github.com/microsoft/vscode-cpptools/releases/download/1.7.1/cpptools-linux.vsix"

elif [ ${ex_num} -eq '2' ] ; then

        jdk_tools=jdk-17_linux-x64_bin.tar.gz
        sudo wget -P /opt/ https://download.oracle.com/java/17/latest/${jdk_tools}

        sudo tar xvzf /opt/${jdk_tools} -C /opt/

        echo "#JAVA#" >> ~/.bashrc
        echo "export JAVA_HOME=/opt/jdk-17.0.1" >> ~/.bashrc
        echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc

        source ~/.bashrc

        wget_inst $"redhat.java-1.1.0.vsix" $"https://github.com/redhat-developer/vscode-java/releases/download/v1.1.0/redhat.java-1.1.0.vsix"
        wget_inst $"vscjava.vscode-java-debug-0.37.0.vsix" $"https://github.com/microsoft/vscode-java-debug/releases/download/0.37.0/vscjava.vscode-java-debug-0.37.0.vsix"
	wget_inst $"vscjava.vscode-java-test-0.22.3.vsix" $"https://github.com/microsoft/vscode-java-test/releases/download/0.22.3/vscjava.vscode-java-test-0.22.3.vsix"
        wget_inst $"vscjava.vscode-maven-0.34.1.vsix" $"https://open-vsx.org/api/vscjava/vscode-maven/0.34.1/file/vscjava.vscode-maven-0.34.1.vsix"
        wget_inst $"vscjava.vscode-java-dependency-0.18.8.vsix" $"https://github.com/microsoft/vscode-java-dependency/releases/download/0.18.8/vscjava.vscode-java-dependency-0.18.8.vsix"

elif [ ${ex_num} -eq '3' ] ; then

	wget_inst $"code-runner-0.9.17.vsix" $"https://github.com/formulahendry/vscode-code-runner/releases/download/0.9.17/code-runner-0.9.17.vsix"

else
        echo "enter integer"
fi
