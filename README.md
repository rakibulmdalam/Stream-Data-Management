Steps to initialize -

1. git clone https://gitlab.lrz.de/ga84doy/kafka-flink-elastic-integration.git

2. cd kafka-flink-elastic-integration

3. sh ./init.sh



# start kafka server
~/kafka_2.12-1.1.0/bin/kafka-server-start.sh ~/kafka_2.12-1.1.0/config/server.properties

#start flink server 
~/flink-1.4.1/bin/start-local.sh

#open tunnel: kafka-flink-elasticsearch
~/flink-1.4.1/bin/flink run streamtunnel-0.1.jar &



# Just in case a Fake Producer is needed

git clone https://gitlab.lrz.de/ga84doy/kafka-flink-elastic-integration.git

cd kafka-flink-elastic-integration

sh ./kafka_installer.sh

sh ./install_python_modules.sh

# run kafka server

~/kafka_2.12-1.1.0/bin/kafka-server-start.sh ~/kafka_2.12-1.1.0/config/server.properties

python3 kafka-producer.py

NB: broker address needs to updated in kafka-producer.py



