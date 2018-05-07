#!/bin/bash

#export ES_HOME=/home/esuser/elasticsearch-6.2.4
#export ES_JAVA_OPTS="$ES_JAVA_OPTS -Des.enforce.bootstrap.checks=false"
#export ES_PATH_CONF=$ES_HOME/config
#export PATH=$PATH:$ES_HOME/bin

echo $JAVA_HOME
echo $ES_HOME
echo $ES_PATH_CONF
echo $PATH

cd $ES_HOME/bin
./elasticsearch
