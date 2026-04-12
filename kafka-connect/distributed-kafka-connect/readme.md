docker run -d --name nessie --network kafka-cluster-confluent_kafka-net -p 19120:19120 projectnessie/nessie:latest

docker run -d --name minio --network kafka-cluster-confluent_kafka-net -p 9000:9000 -p 9001:9001 -e MINIO_ROOT_USER=minio -e MINIO_ROOT_PASSWORD=minio123 minio/minio server /data --console-address ":9001"

MinIO has been set up and is running as a Docker container on the same network. 
It's accessible at http://localhost:9000 for the API 
and http://localhost:9001 for the console (login with minio/minio123). 

The Iceberg connector config already matches these credentials and endpoint. 
You can now create the "my-bucket" bucket in MinIO if needed for the warehouse. 

If you require further configuration, let me know.

