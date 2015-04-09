#! /usr/bin/env bash
docker build -t elasticsearch .
docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -v $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/data:/data -v $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/config:/elasticsearch/config --restart always elasticsearch
