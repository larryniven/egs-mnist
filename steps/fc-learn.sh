#!/bin/bash

. ./path.sh

epoch=$1

exp=exp/fc800-step0.01-clip5/

OPENBLAS_CORETYPE=Sandybridge OMP_NUM_THREADS=2 $dist/nnbin/fc-learn \
    --input-scp data/train-norm.bimg.scp \
    --label-scp data/train.blabel.scp \
    --param $exp/param-$((epoch-1)) \
    --opt-data $exp/opt-data-$((epoch-1)) \
    --output-param $exp/param-$epoch \
    --output-opt-data $exp/opt-data-$epoch \
    --label data/digits.txt \
    --seed $i \
    --shuffle \
    --opt const-step \
    --step-size 0.01 \
    --clip 5 \
    > $exp/log-$i
