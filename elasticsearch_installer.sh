cd ~
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.6.deb
sudo dpkg -i elasticsearch-5.6.6.deb
sudo apt install -f

sudo service elasticsearch start
