#!/bin/sh
docker run -p 9201:9200 -p 9301:9300 \
	--name es-t1 \
	--network es-net \
	--rm \
	--hostname Elas02 \
	--cap-add=IPC_LOCK --ulimit nofile=65536:65536 --ulimit memlock=-1:-1 \
	-e ES_HEAP_SIZE="1g" -e network.host=Elas02 -e "discovery.zen.ping.unicast.hosts: ['Elas01']" \
	-v /home/dhanuka/projects/docker/elasticsearch-docker/elasticsearch2.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
	docker.elastic.co/elasticsearch/elasticsearch:6.3.2 
