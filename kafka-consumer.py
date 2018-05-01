from kafka import KafkaConsumer

# To consume latest messages and auto-commit offsets
consumer = KafkaConsumer('temperature',
                         group_id='iot-pract-test-data',
                         bootstrap_servers=['localhost:9092'])
for message in consumer:
    print (message)
