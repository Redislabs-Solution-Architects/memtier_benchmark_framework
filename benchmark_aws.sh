#!/bin/bash

export EC_HOST=$(terraform output -raw ec | jq -r '.hostname')
export EC_PORT=$(terraform output -raw ec | jq -r '.port')
export EC_PASS=$(terraform output -raw ec | jq -r '.access_key')

export MEMTIER_USER=$(terraform output -raw ec2-memtier | jq -r '.user')
export MEMTIER_HOST=$(terraform output -raw ec2-memtier | jq -r '.host')
export MEMTIER_BIN=$(terraform output -raw ec2-memtier | jq -r '.program')

echo "Executing Memtier Benchmark via SSH"
ssh -o UserKnownHostsFile=/dev/null -i privateKey -o StrictHostKeyChecking=no "$MEMTIER_USER"@"$MEMTIER_HOST" "$MEMTIER_BIN -s $EC_HOST -p $EC_PORT --tls --tls-skip-verify --pipeline=1 -c 4 -t 12 --distinct-client-seed --hide-histogram --key-pattern=S:S --key-maximum=1000000 --test-time=30 --data-size=100 --ratio=1:1 --cluster-mode"