# start elasticsearch
nohup sudo service elasticsearch start
# start kibana
nohup sudo systemctl start kibana.service

# start zookeeper
nohup sudo service zookeeper start

# start kafka
nohup ~/kafka_2.12-1.1.0/bin/kafka-server-start.sh ~/kafka_2.12-1.1.0/config/server.properties

# start flink
nohup ~/flink-1.4.1/bin/start-local.sh

# open tunnel: kafka-flink-elasticsearch
nohup ~/flink-1.4.1/bin/flink run streamtunnel-0.1.jar &
