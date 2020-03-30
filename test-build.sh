#!/usr/bin/env bash

wget https://rancher-dsop-dependencies.nyc3.digitaloceanspaces.com/weaveworks/weave-kube/kube-utils
wget https://rancher-dsop-dependencies.nyc3.digitaloceanspaces.com/weaveworks/weave-kube/launch.sh
wget https://rancher-dsop-dependencies.nyc3.digitaloceanspaces.com/weaveworks/weave-kube/weaveutil

docker build -t test .