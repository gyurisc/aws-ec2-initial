#!/usr/bin/env bash

sudo locale-gen en_AU.UTF-8
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
sudo apt-get install -y -q zsh git zip unzip build-essential htop
sudo apt-get clean

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i '/^ZSH_THEME=/s/robbyrussell/frisk/' ~/.zshrc
sed -i '/^plugins=/s/)/ ubuntu)/' ~/.zshrc
sudo chsh ubuntu -s $(which zsh)

wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-2.5.0-Linux-x86_64.sh
bash Anaconda2-2.5.0-Linux-x86_64.sh -b
echo 'export PATH="$HOME/anaconda2/bin:$PATH"' >> ~/.zshrc
. ~/.zshrc
