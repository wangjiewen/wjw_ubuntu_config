# change source totsinghua and upgrade
sudo cp ./sources.list /etc/apt/
sudo apt update
sudo apt upgrade
# install fundamental apps
sudo apt install vim emacs chromium-browser tree git tmux gcc g++ shadowsocks steam-installer fcitx sogoupinyin vim-gnome curl wget
sudo apt remove ibus
# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# shadowsocks
cp ./ss.json /home/sinfonia

sudo ln -fs /lib/systemd/rc-local.service /etc/systemd/system/rc-local.service
sudo echo '' >> /lib/systemd/rc-local.service
sudo echo '[Install]' >> /lib/systemd/rc-local.service
sudo echo 'WantedBy=multi-user.target' >> /lib/systemd/rc-local.service
sudo echo 'Alias=rc-local.service' >> /lib/systemd/rc-local.service

sudo touch /etc/rc.local
sudo chmod 0755 /etc/rc.local
sudo echo '#!/bin/bash' >> /etc/rc.local
sudo echo 'sslocal -c /home/sinfonia/ss.json &' >> /etc/rc.local
# numix theme
sudo add-apt-repository ppa:numix/ppa
sudp apt update
sudp apt install numix* gnome-tweak-tool
# typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt update
sudo apt install typora
# oh my zsh
sudo apt install zsh fonts-powerline
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo '' >> ~/.zshrc
echo 'export DEFAULT_USER="sinfonia"' >> ~/.zshrc
# git config
git config --global user.name "wangjiewen"
git config --global user.email "issinfonia@gmail.com"
ssh-keygen -t rsa -C "issinfonia@gmail.com"
####
# manually configs
#
# 1. sogoupinyin
# change to fcitx 
# "configre current input method"
#
# 2. switchomega
# in chrome as a hotplug
# setting [proxy] -> 
# proxy servers[protocol(socks5), server(127.0.0.1), port(1080)] ->
# setting [autoswitch] ->
# rule list rules as [proxy] and Default as [direct] ->
# rule list url ->
# https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt ->
# auto switch
#
# 3. oh my zsh
# refer in https://www.jianshu.com/p/9a5c4cb0452d
# change ZSH_THEME="agnoster" in ~/.zsh.rc
# 
# 4. jetbrain && idea
####
