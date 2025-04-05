# DockerLearning
## Docker Compose Files
1. Open Search Setup : opensearch-docker-compose.yaml
2. ElasticSearch/Kibana/Logstash: elk-docker-compose.yaml


## Running elk stack docker-compose file
```zsh
docker-compose -f elk-docker-compose.yaml up
```

## Stopping elk stack docker-compse file
```zsh
docker-compose -f elk-docker-compose.yaml down
```

## Stopping elk stack docker-compse file with volume removal
```zsh
docker-compose -f elk-docker-compose.yaml down -v
```
# Links
[Open Search](http://localhost:9200)

[Kibana](http://localhost:5601)
