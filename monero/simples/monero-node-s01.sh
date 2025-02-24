#!/bin/bash

# https://p2pool.io/#help
monerod --config-file /monero/monerod.conf \
        --zmq-pub tcp://0.0.0.0:18083 \
        --out-peers 32 \
        --in-peers 64 \
        --add-priority-node=p2pmd.xmrvsbeast.com:18080 \
        --add-priority-node=nodes.hashvault.pro:18080 \
        --disable-dns-checkpoints \
        --enable-dns-blocklist
