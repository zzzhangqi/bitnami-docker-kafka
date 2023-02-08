#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

## This script works with Rainbond

# define kafka broker id
KAFKA_CFG_BROKER_ID=${HOSTNAME#*-}

# define zk server Addr
if [ -z $DEPEND_SERVICE ]; then
    export KAFKA_CFG_ZOOKEEPER_CONNECT=${ZOOKEEPER_HOST}:${ZOOKEEPER_PORT}
fi

# set default_java_mem_opts
case ${MEMORY_SIZE} in
    "micro")
       export KAFKA_HEAP_OPTS="-Xmx128m -Xms128m"
       echo "Optimizing java process for 128M Memory...." >&2
       ;;
    "small")
       export KAFKA_HEAP_OPTS="-Xmx256m -Xms256m"
       echo "Optimizing java process for 256M Memory...." >&2
       ;;
    "medium")
       export KAFKA_HEAP_OPTS="-Xmx512m -Xms512m"
       echo "Optimizing java process for 512M Memory...." >&2
       ;;
    "large")
       export KAFKA_HEAP_OPTS="-Xmx1024m -Xms1024m"
       echo "Optimizing java process for 1G Memory...." >&2
       ;;
    "2xlarge")
       export KAFKA_HEAP_OPTS="-Xmx2048m -Xms2048m"
       echo "Optimizing java process for 2G Memory...." >&2
       ;;
    "4xlarge")
       export KAFKA_HEAP_OPTS="-Xmx4096m -Xms4096m"
       echo "Optimizing java process for 4G Memory...." >&2
       ;;
    "8xlarge")
       export KAFKA_HEAP_OPTS="-Xmx8192m -Xms8192m"
       echo "Optimizing java process for 8G Memory...." >&2
       ;;
    16xlarge|32xlarge|64xlarge)
       export KAFKA_HEAP_OPTS="-Xmx16384m -Xms16384m"
       echo "Optimizing java process for biger Memory...." >&2
       ;;
esac
