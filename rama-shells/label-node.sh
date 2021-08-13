#!/usr/bin/env bash

kubectl label nodes $1 kubernetes.io/role=worker
kubectl label nodes $1 network=$2
