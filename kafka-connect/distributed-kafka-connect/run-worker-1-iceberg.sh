docker run \
  --env-file environment.env \
  --name kafka-connect-worker-1-iceberg \
  -e CONNECT_REST_ADVERTISED_HOST_NAME=kafka-connect-worker-1-iceberg \
  -e CONNECT_REST_ADVERTISED_PORT=8083 \
  -p 8083:8083 \
  --network kafka-cluster-confluent_kafka-net \
  kafka-connect-iceberg:1.0.0
