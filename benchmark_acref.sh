#!/bin/bash

export ACREF_HOST=$(terraform output -raw acref | jq -r '.host')
export ACREF_PORT=$(terraform output -raw acref | jq -r '.port')
export ACREF_PASS=$(terraform output -raw acref | jq -r '.access_key')

export MEMTIER_USER=$(terraform output -raw memtier | jq -r '.user')
export MEMTIER_HOST=$(terraform output -raw memtier | jq -r '.host')
export MEMTIER_BIN=$(terraform output -raw memtier | jq -r '.program')

echo "Executing Memtier Benchmark via SSH"
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$MEMTIER_USER"@"$MEMTIER_HOST" "$MEMTIER_BIN -s $ACREF_HOST -p $ACREF_PORT -a $ACREF_PASS --tls --tls-skip-verify --pipeline=1 -c 4 -t 12 --distinct-client-seed --hide-histogram --key-pattern=S:S --key-maximum=1000000 --test-time=30 --data-size=100 --ratio=1:1 --cluster-mode"