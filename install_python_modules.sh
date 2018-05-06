sudo apt-get install python3-pip -y &>/dev/null

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales

sudo pip3 install kafka-python
