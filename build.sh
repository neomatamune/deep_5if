#!/usr/bin/env bash
sudo docker build -t caffe:cpu ./caffe-intel-4threads
docker build -t deep .
