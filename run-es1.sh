#!/bin/sh
docker run -p 9200:9200 -p 9300:9300 \
	--name es-t0 \
	--network es-net \
	--rm \
	--cap-add=IPC_LOCK --ulimit nofile=65536:65536 --ulimit memlock=-1:-1 \
	-e "ES_JAVA_OPTS= -Xms2g -Xmx2g" -e cluster.name=docker-cluster -e bootstrap.memory_lock=true \
	-v /home/dhanuka/projects/docker/esdata1:/usr/share/elasticsearch/data \
	docker.elastic.co/elasticsearch/elasticsearch:6.3.2 
	
