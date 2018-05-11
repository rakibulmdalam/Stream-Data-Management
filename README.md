# Steps to initialize -

```
git clone https://gitlab.lrz.de/ga84doy/kafka-flink-elastic-integration.git

cd kafka-flink-elastic-integration

sh ./init.sh
```

# Start streaming
```
//start kafka server
~/kafka_2.12-1.1.0/bin/kafka-server-start.sh ~/kafka_2.12-1.1.0/config/server.properties

//open tunnel (kafka-flink-elasticsearch)
~/flink-1.4.1/bin/flink run streamtunnel-0.1.jar &
```


# Just in case a Fake Producer is needed
```
git clone https://gitlab.lrz.de/ga84doy/kafka-flink-elastic-integration.git

cd kafka-flink-elastic-integration

sh ./kafka_installer.sh

sh ./install_python_modules.sh

//run kafka server
~/kafka_2.12-1.1.0/bin/kafka-server-start.sh ~/kafka_2.12-1.1.0/config/server.properties

//run kafka producer
python3 kafka-producer.py
```

# Notes
- broker address may need to be updated in kafka-producer.py
- iptables should be updated with permissions to access kafka from outside




