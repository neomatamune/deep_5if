#!/usr/bin/env bash
docker run -p 8887:8888 -v ./notebooks:/base/notebooks -v ./data:/base/data -d deep