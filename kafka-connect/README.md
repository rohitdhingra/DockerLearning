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
# 2. Setting up Kafka Cluster
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

## 2.3. Describe topic in the Kafka Cluster
```
cd /Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/bin
./kafka-topics.sh --describe --topic topic1 --bootstrap-server localhost:9094
```

# 3. Setting up Kafka Connect for Source and Sink Connectors

## 3.1 Download the JDBC Connector for MySQL and Postgres to below location
```
/Users/rohitdhingra/Downloads/DevelopmentWS/DockerLearning/kafka-connect/plugins
```
## 3.2. Update plugins path in the connect-standalone.properties(/Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/config/connect-standalone.properties) file
```
plugin.path=/Users/rohitdhingra/Downloads/DevelopmentWS/DockerLearning/kafka-connect/plugins
```

## 3.3. Copy the connector properties to the config folder of local kafka installation
```
cd /Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/config
cp /Users/rohitdhingra/Downloads/DevelopmentWS/DockerLearning/kafka-connect/mysql-jdbc-connector.properties /Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/config/
```

## 3.4. Start the Kafka Connect Standalone Worker
```
cd /Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/bin
./connect-standalone.sh ../config/connect-standalone.properties ../config/mysql-jdbc-connector.properties
```

## 3.5. Listing Down the topics in the Kafka Cluster
``` 
cd /Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/bin
./kafka-topics.sh --list  --bootstrap-server localhost:9092

```

## 3.5. Listing Events in the user_profiles topic in the Kafka Cluster
``` 
cd /Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/bin
./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic user_profiles --from-beginning

```

## 3.6. Copy the postgres connector properties to the config folder of local kafka installation
```
cd /Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/config
cp /Users/rohitdhingra/Downloads/DevelopmentWS/DockerLearning/kafka-connect/postgresql-jdbc-sink-connector.properties /Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/config/
```

## 3.7. Start the Kafka Connect Standalone Worker for both Sink Connector
```
cd /Users/rohitdhingra/Downloads/Softwares/kafka_2.13-4.2.0/bin
./connect-standalone.sh ../config/connect-standalone.properties ../config/mysql-jdbc-connector.properties ../config/postgresql-jdbc-sink-connector.properties
```
