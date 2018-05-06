# start elasticsearch
nohup sudo service elasticsearch start
# start kibana
nohup sudo systemctl start kibana.service

# start zookeeper
nohup sudo service zookeeper start

# start kafka
nohup ~/iot/kafka_2.12-1.1.0/bin/kafka-server-start.sh ~/iot/kafka_2.12-1.1.0/config/server.properties

# start flink
nohup ~/iot/flink-1.4.1/bin/start-local.sh

# open tunnel: kafka-flink-elasticsearch
nohup ~/iot/flink-1.4.1/bin/flink run streamtunnel-0.1.jar
