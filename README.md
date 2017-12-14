# mongodb-sharded-cluster-docker
## Setup
### Target
| database | collection |
|:--------:|:----------:|
| test | test_collection |
### 1. Start a cluster.
```sh
docker-compose up -d
```
### 2. Connect a mongo shell to the mongos.
```sh
docker exec -it mongo-router mongo
```
### 3. Enable sharding for a database.
```sh
use admin
sh.enableSharding("test")
```
### 4. Create an index on the shard key.
```sh
use test
db.test_collection.createIndex({number: 1})
```
### 5. Shard the collection.
``` sh
use test
sh.shardCollection("test.test_collection", {"number": 1})
```
