#!/bin/sh
docker run --name es-t1 \
	--network es-net \
	--rm \
	--cap-add=IPC_LOCK --ulimit nofile=65536:65536 --ulimit memlock=-1:-1 \
	-e "ES_JAVA_OPTS=-Xms512m -Xmx512m" -e cluster.name=docker-cluster -e bootstrap.memory_lock=true -e "discovery.zen.ping.unicast.hosts=es-t0" \
	-v esdata2:/usr/share/elasticsearch/data \
	docker.elastic.co/elasticsearch/elasticsearch:6.3.2 
