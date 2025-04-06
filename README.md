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

## Creating backup repository
```zsh
curl -XPUT http://localhost:9200/_snapshot/my_backup_repo -H 'Content-Type: application/json' -d '{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/snapshots",  
    "compress": true
  }
}'
```

## Creating snapshot in backup repository
```zsh
curl -XPUT http://localhost:9200/_snapshot/my_backup_repo/snapshot_people_06_apr2025_2 -H 'Content-Type: application/json' -d '
{
  "indices": "people",
  "ignore_unavailable": true,
  "include_global_state": false
}
'
```

## Creating snapshot in backup repository
```zsh
curl -XPOST http://localhost:9200/_snapshot/my_backup_repo/snapshot_people_06_apr2025_2/_restore -H 'Content-Type: application/json' -d '
{
   "indices": "people",
  "rename_pattern": "people",
  "rename_replacement": "people-temp"
}
'
```
# Links
[Open Search](http://localhost:9200)

[Kibana](http://localhost:5601)
