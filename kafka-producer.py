from kafka import KafkaProducer
from kafka.errors import KafkaError
import random
from time import sleep

producer = KafkaProducer(bootstrap_servers=['localhost:9092'])

while True:
    try:
        # Asynchronous by default
        temperature = random.uniform(-10, 39)
        future = producer.send('temperature', bytes(str(temperature), "utf-8"))
        response = future.get(timeout=10)
        sleep(1)
    except KafkaError:
        log.exception()

    print(response)
