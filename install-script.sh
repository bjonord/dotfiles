apt-get update

apt-get install -y aptitude gnome-terminal vim gnome-disk-utility
# => unused packages can be found using:
#
#   popularity-contest 2> /dev/null | grep '<OLD>'

aptitude purge -y command-not-found
aptitude purge -y ~i.*whoopsie
aptitude purge -y ~ibrltty ~iespeak speech-dispatcher gnome-accessibility-themes
aptitude purge -y hplip hplip-data libhpmud0 libsane-hpaio printer-driver-hpcups printer-driver-postscript-hp
aptitude purge -y gnome-sudoku
aptitude purge -y simple-scan ~ionboard
aptitude purge -y pcmciautils
aptitude purge -y banshee gmusicbrowser ~ibanshee parole orage mousepad xfce4-terminal ristretto nano

# export RELEASE=wily

# Enable partner repository
#
perl -i -pe 's/# *(deb.* partner)$/\1/' /etc/apt/sources.list

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian $RELEASE contrib" >> /etc/apt/sources.list

wget -O - http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_15.04/Release.key | apt-key add -
echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_15.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

wget -O - http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.10/Release.key | apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/ /' >> /etc/apt/sources.list.d/arc-theme.list

add-apt-repository -y ppa:wine/wine-builds
add-apt-repository -y ppa:stebbins/handbrake-releases
apt-add-repository -y ppa:thomas.tsai/ubuntu-tuxboot     # for clonezilla
add-apt-repository -y ppa:subdownloader-developers/ppa
add-apt-repository -y ppa:pinta-maintainers/pinta-stable
add-apt-repository -y ppa:stefanobalocco/ppa             # aacgain
add-apt-repository -y ppa:nviennot/tmate
# add-apt-repository -y ppa:brightbox/ruby-ng
add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
add-apt-repository -y ppa:hugin/hugin-builds
# add-apt-repository -y ppa:gezakovacs/ppa               # unetbootin

# matroska tools
#
# curl http://www.bunkus.org/gpg-pub-moritzbunkus.txt | apt-key add -
# echo 'deb http://www.bunkus.org/ubuntu/precise/ ./' >> /etc/apt/sources.list
# echo 'deb-src http://www.bunkus.org/ubuntu/precise/ ./' >> /etc/apt/sources.list

# fix sources not updated to the current release
#
perl -i -pe "s/$RELEASE/raring/g" /etc/apt/sources.list.d/*subdownloader*
perl -i -pe "s/$RELEASE/vivid/g" /etc/apt/sources.list.d/*tmate*
perl -i -pe "s/$RELEASE/utopic/g" /etc/apt/sources.list.d/*pinta*
perl -i -pe "s/$RELEASE/trusty/g" /etc/apt/sources.list.d/*balocco*
perl -i -pe "s/$RELEASE/vivid/g" /etc/apt/sources.list.d/*tuxboot*

aptitude update

# Libraries used/notes:
#
#   libnl-dev, libncurses5-dev: powertop
#   qemu-kvm:  mounting vdi
#   libpango1.0-dev libreadline-dev: ruby
#   nodejs line: rails/ticketsolve; duplicated packages are for reference
#   debian-goodies: checkrestart
#   libssl-dev tk8.5-dev: ruby
#
# Ruby is currently installed from source. Brightbox packages are:
#
#   ruby2.1 ruby2.1-dev ruby2.1-tcltk
#
apt-get install \
         curl git-core gitk libstdc++5 lib32stdc++6 lsb sqlite3 whois \
         p7zip-full vbindiff pv tree \
         autoconf ack-grep silversearcher-ag indicator-cpufreq  \
         meld links pixz pigz sysstat libav-tools dconf-editor \
         gnome-tweak-tool dconf-cli \
         traceroute inotify-tools smart-notifier iotop \
         gdebi libncurses5-dev libpango1.0-dev libreadline-dev \
         nodejs libssl-dev tk8.5-dev debconf-utils \
         libgmp-dev libxslt1-dev libxml2-dev zlib1g-dev \
         imagemagick libsqlite3-dev libxslt1.1 libmysqlclient-dev \
         openjdk-7-jdk trash-cli emacs24 elasticsearch mysql-client-5.6 \
         mysql-server-5.6 htop terminator zsh redis

# only main machine:
apt-get install \
         pinta calibre unrar cowsay libreoffice eog \
         ntp hexchat vlc skype cheese parallel \
         usb-creator-gtk gtk-recordmydesktop \
         pulseaudio-module-bluetooth winehq-devel \
         iperf handbrake-gtk diodon \
         shutter chromium-browser plank \
         postgresql postgresql-contrib virtualbox-5.0 \
         network-manager-openvpn network-manager-vpnc

# update smartmontools devices db (includes Samsung 850 Pro)
#
update-smart-drivedb

# configure cap locks as compose key
#
perl -i -pe 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:caps"/' /etc/default/keyboard

# disable guest session
#
printf "[SeatDefaults]\nallow-guest=false\n" > /usr/share/lightdm/lightdm.conf.d/50-no-guest.conf

# disable error reporting
#
perl -i -pe 's/^enabled=1/enabled=0/' /etc/default/apport

# disable locale forwarding; see http://j.mp/1rtfqtb
#
perl -i -pe 's/^[ #]*SendEnv LANG LC_\*/    #SendEnv LANG LC_*/' /etc/ssh/ssh_config

# Inotify max open files
#
echo fs.inotify.max_user_watches=1048576 >> /etc/sysctl.conf

# 2.1.7 has an issue which causes TK to take many seconds to load, which is a dealbraker with poor
# man's spotlight.
#
# Reference for TK fix:
#
#   http://ruby.11.x6.nabble.com/quot-You-have-to-install-development-tools-first-quot-Windows-td3368402.html
#
cd /usr/local/src
curl -s https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.7.tar.gz | tar zxv
cd ruby-2.1.7
./configure && make && make install

ln -s /usr/lib/x86_64-linux-gnu/libtcl8.5.so.0 /usr/lib/libtcl8.5.so.0
ln -s /usr/lib/x86_64-linux-gnu/libtk8.5.so.0 /usr/lib/libtk8.5.so.0
ln -s /usr/lib/x86_64-linux-gnu/tcl8.5/tclConfig.sh /usr/lib/tclConfig.sh
ln -s /usr/lib/x86_64-linux-gnu/tk8.5/tkConfig.sh /usr/lib/tkConfig.sh

cd ext/readline
ruby extconf.rb && make && make install
cd ../../ext/tk
ruby extconf.rb && make && make install
cd tkutil
ruby extconf.rb && make && make install

# byebug is for downer.rb
#
gem install --no-ri --no-rdoc bundler byebug

################################################################
# MANUAL PACKAGES
################################################################

wget https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb -O /tmp/google-talkplugin_current_amd64.deb
gdebi -n !$

wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb -O /tmp/steam.deb
gdebi -n !$

wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb -O /tmp/dropbox.deb
gdebi -n !$

# downer.rb 'https://www.virtualbox.org/wiki/Downloads' \
#             'http://download.virtualbox.org/virtualbox/[0-9.]+/Oracle_VM_VirtualBox_Extension_Pack-[0-9.]+-\d+.vbox-extpack'

# downer.rb 'https://www.vagrantup.com/downloads.html' \
#             'https://dl.bintray.com/mitchellh/vagrant/vagrant_[0-9.]+_x86_64.deb'

# downer.rb 'http://www.dragondisk.com/download-amazon-s3-client-google-cloud-storage-client.html' \
#             'http://download.dragondisk.com/dragondisk_[0-9.]+-\dubuntu_amd64.deb'

# downer.rb 'http://www.sublimetext.com/3' \
#             'http://[a-z0-9.]+.rackcdn.com/sublime-text_build-\d+_amd64.deb'

sh !$

# F*kk zeitgeist!!!
#
chmod -rw ~/.local/share/zeitgeist/activity.sqlite

# System ruby gems
# sudo su is needed as workaround for the bundler parallel install bug
#
bundle config --global jobs 4
sudo whoami
cd ~/code/scripts && bundle install
cd ~/code/scripts_noshare && bundle install

# RVM+ruby 2.1.8, for Ticketsolve
#
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.bashrc
rvm install 2.1.8
gem install bundler
rvm use --default system

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
# Update & configure
#
steam
