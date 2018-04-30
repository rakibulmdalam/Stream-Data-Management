set -e
echo "checking port 2181 availability..."
if ! lsof -i:2181
then
    echo "2181 is free"
    echo "installing zookeeper...."
    sudo apt-get install zookeeperd
    echo "installing kafka..."
    if ! lsof -i:9092
    then
      wget http://apache.lauf-forum.at/kafka/1.1.0/kafka_2.12-1.1.0.tgz
      tar -xvf kafka_2.12-1.1.0.tgz
      cd ./kafka_2.12-1.1.0
      echo "starting kafka server..."
      ~/kafka_2.12-1.1.0/bin/kafka-server-start.sh ~/kafka_2.12-1.1.0/config/server.properties
    else
      echo "kafka default port [9092] is in use"
else
    echo "2181 is occupied"
fi
