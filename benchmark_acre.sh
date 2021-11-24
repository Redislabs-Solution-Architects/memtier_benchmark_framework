#!/bin/bash

export ACRE_HOST=$(terraform output -raw acre | jq -r '.host')
export ACRE_PORT=$(terraform output -raw acre | jq -r '.port')
export ACRE_PASS=$(terraform output -raw acre | jq -r '.access_key')

export MEMTIER_USER=$(terraform output -raw memtier | jq -r '.user')
export MEMTIER_HOST=$(terraform output -raw memtier | jq -r '.host')
export MEMTIER_BIN=$(terraform output -raw memtier | jq -r '.program')

echo "Executing Memtier Benchmark via SSH"
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$MEMTIER_USER"@"$MEMTIER_HOST" "$MEMTIER_BIN -s $ACRE_HOST -p $ACRE_PORT -a $ACRE_PASS --tls --tls-skip-verify --pipeline=1 -c 4 -t 12 --distinct-client-seed --hide-histogram --key-pattern=S:S --key-maximum=1000000 --test-time=30 --data-size=100 --ratio=1:1 --cluster-mode"