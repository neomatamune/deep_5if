#!/usr/bin/env bash
docker run -p 8887:8888 \
 --mount type=bind,source="$(pwd)"/notebooks,target=/base/notebooks \
 --mount type=bind,source="$(pwd)"/data,target=/base/data \
 -d --name deep_jupyter deep