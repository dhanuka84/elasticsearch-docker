#!/bin/sh
docker run -p 9200:9200 -p 9300:9300 \
	--name es-t0 \
	--rm \
	--ulimit nofile=65536:65536 --ulimit memlock=-1:-1 \
	-e ES_HEAP_SIZE="1g" \
	-v /home/dhanuka/projects/docker/elasticsearch-docker/elasticsearch1.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
	docker.elastic.co/elasticsearch/elasticsearch:6.3.2 
	
