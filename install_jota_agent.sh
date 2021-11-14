#!/bin/sh

# jcode에서 jota로 채점할 수 있게 해주는 extension 설치

# parsing & download
jcode_jota_latest_link="https://github.com/Sabro98/jcode-jota/releases/latest/download/jcode-jota.vsix"
wget $jcode_jota_latest_link
mv jcode-jota.vsix ./extension/jcode-jota.vsix

# install
code-server --install-extension ./extension/jcode-jota.vsix
