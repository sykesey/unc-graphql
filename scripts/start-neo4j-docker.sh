#!/bin/sh

NEO4J_VERSION=4.2.0
APOC_VERSION=4.2.0.0
mkdir -p $HOME/docker/neo4j/data
mkdir -p $HOME/docker/neo4j/logs
mkdir -p $HOME/docker/neo4j/plugins
mkdir -p $HOME/docker/neo4j/import

if [ ! -f $HOME/docker/neo4j/plugins/apoc-${APOC_VERSION}-all.jar ]; then
 echo "Downloading https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/${APOC_VERSION}/apoc-${APOC_VERSION}-all.jar"
 curl -L https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/${APOC_VERSION}/apoc-${APOC_VERSION}-all.jar >$HOME/docker/neo4j/plugins/apoc-${APOC_VERSION}-all.jar
fi

docker run -d --name myneo4j  \
   -e NEO4J_AUTH=neo4j/letmein \
   -v $HOME/docker/neo4j/logs:/logs \
   -v $HOME/docker/neo4j/import:/var/lib/neo4j/import \
   -v $HOME/docker/neo4j/plugins:/plugins \
   -v $HOME/docker/neo4j/data:/data \
   -p7687:7687 -p7474:7474 -p7473:7473  \
   neo4j:$NEO4J_VERSION
