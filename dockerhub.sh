#!/usr/bin/env bash
set -ex

# automate tagging with the short commit hash
docker build --no-cache -t jabahum/efris_tcs:$(git rev-parse --short HEAD) .
docker tag jabahum/efris_tcs:$(git rev-parse --short HEAD) jabahum/efris_tcs
docker push jabahum/efris_tcs:$(git rev-parse --short HEAD)
docker push jabahum/efris_tcs:latest