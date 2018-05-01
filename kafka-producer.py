from kafka import KafkaProducer
from kafka.errors import KafkaError

producer = KafkaProducer(bootstrap_servers=['localhost:9092'])

# Asynchronous by default
temperature = random.uniform(-10, 39)
future = producer.send('temperature', temperature)

for i in range(10):
    try:
        response = future.get(timeout=10)
    except KafkaError:
        log.exception()

print(response)
