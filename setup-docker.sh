#!/bin/bash

docker build -t adham/foodtrucks-web .

docker network create foodtrucks-net

docker run -d --name es --net foodtrucks-net -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2

docker run -d --net foodtrucks-net -p 5000:5000 --name foodtrucks-web adham/foodtrucks-web