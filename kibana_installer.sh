cd ~
wget https://artifacts.elastic.co/downloads/kibana/kibana-5.0.2-amd64.deb
sudo dpkg -i kibana-5.0.2-amd64.deb
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service

sudo systemctl start kibana.service
