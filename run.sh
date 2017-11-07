#!/bin/bash

steps/prepare-data.sh

steps/build.sh

mkdir -p exp/fc800-step0.01-clip5

utils/init-fc.py random > exp/fc800-step0.01-clip5/param-0
utils/init-fc.py zero | tail -n+2 > exp/fc800-step0.01-clip5/opt-data-0

for i in {1..10}; do
    echo "epoch: $i"
    steps/fc-learn.sh $i
done
