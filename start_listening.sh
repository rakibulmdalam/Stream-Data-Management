# start elasticsearch
sudo service elasticsearch start
# start kibana
sudo systemctl start kibana.service

# start zookeeper
sudo service zookeeper status

# start kafka
~/iot/kafka_2.12-1.1.0/bin/kafka-server-start.sh ~/iot/kafka_2.12-1.1.0/config/server.properties

# start flink
~/iot/flink-1.4.1/bin/start-local.sh

# open tunnel: kafka-flink-elasticsearch
~/iot/flink-1.4.1/bin/flink run tunnel_kafka_flink_elastic.jar
