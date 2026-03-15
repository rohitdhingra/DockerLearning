# 1. Kafka Connect Commands
## 1.1 Prerequisites

### 1.1.1. Setting up MysQL Container without library database
```
docker run --name mysql-kafka -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql:latest
```

### 1.1.2. Executing mysql command in docker container
```
docker exec -it mysql-kafka mysql -u root -p
```

### 1.1.3. Enter Mysql Password

### 1.1.4 Quit mysql container
```
quit
```

### 1.1.5 Removing the mysql container
```
docker rm -f mysql-kafka
```

### 1.2.1. Setting up Postgres Container without library database
```
docker run --name postgres-kafka -e POSTGRES_PASSWORD=root -p 5432:5432 -d postgres:latest
```

### 1.2.2. Executing mysql command in docker container
```
docker exec -it postgres-kafka psql -U postgres
```

### 1.2.4 Quit psql container
```
quit
```

### 1.2.5 Removing the psql container
```
docker rm -f postgres-kafka
```

## 2.1. Running Kafka Cluster using docker compose
```
cd /Users/rohitdhingra/Downloads/DevelopmentWS/DockerLearning/kafka-connect/kafka-cluster-confluent
docker-compose -f docker-compose-kafka-cluster-confluent.yml --env-file environment.env up
```

## 2.2. Creating a topic in the Kafka Cluster
```
cd /Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/bin
./kafka-topics.sh --create --topic topic1 --partitions 3 --replication-factor 3 --bootstrap-server localhost:9092 
```

## 2.2. Describe topic in the Kafka Cluster
```
./kafka-topics.sh --describe --topic topic1 --bootstrap-server localhost:9094
```


## 3.1. Download Connectors from the confluent hub
https://www.confluent.io/hub/

