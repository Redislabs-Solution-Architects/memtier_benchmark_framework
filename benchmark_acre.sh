#!/bin/bash

export ACRE_HOST=$(terraform output -raw acre | jq -r '.host')
export ACRE_PORT=$(terraform output -raw acre | jq -r '.port')
export ACRE_PASS=$(terraform output -raw acre | jq -r '.access_key')

export MEMTIER_USER=$(terraform output -raw memtier | jq -r '.user')
export MEMTIER_HOST=$(terraform output -raw memtier | jq -r '.host')
export MEMTIER_BIN=$(terraform output -raw memtier | jq -r '.program')

echo "Executing Memtier Benchmark via SSH"
echo "• --ratio=1:1 (SET:GET ratio)
      • --data-size=100 (100B value size)
      • --test-time=300 --run-count=3 (3 runs of 5 minutes each)
      • --key-maximum=1000000
      • --key-pattern=S:S (produces higher Ops/Sec than –key-pattern=P:P)
      • --hide-histogram
      • --distinct-client-seed
      • -c 3 -t 14 (for all OSS clustered caches and E10/E20 Enterprise clustered caches only)*
      • --pipeline=1000 (produces higher Ops/Sec than --pipeline=15, but does increase latency)
      • [--cluster-mode] (for OSS clustering only)
      • [--tls --tls-skip-verify] (for SSL only)
      To keep the number of client connections consistent between OSS clustered caches and Enterprise clustered caches, the “-c” parameter was increased as follows for Enterprise clustered cache benchmarking:
      • E50/E100 Capacity 2 and E10/E20 Capacity 4 caches (achieves 84 clients): • -c6-t14
      • E50/E100 Capacity 4 caches (achieves 168 clients): • -c12-t14
      • F300/F700/F1500 Capacity 3 caches (achieves 126 clients): • -c9-t14
      • F300/F700/F1500 Capacity 9 caches (achieves 378 clients): • -c27-t14"
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$MEMTIER_USER"@"$MEMTIER_HOST" "$MEMTIER_BIN -s $ACRE_HOST -p $ACRE_PORT -a $ACRE_PASS --tls --tls-skip-verify --pipeline=15 -c 12 -t 14 --distinct-client-seed --hide-histogram --key-pattern=S:S --key-maximum=1000000 --test-time=30 --data-size=100 --ratio=1:1"
