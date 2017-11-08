#!/bin/bash

. ./path.sh

epoch=$1

exp=exp/fc800-step0.01-clip5

OPENBLAS_CORETYPE=Sandybridge OMP_NUM_THREADS=1 $dist/nnbin/fc-predict \
    --input-scp data/test-norm.bimg.scp \
    --param $exp/param-$epoch \
    --label data/digits.txt \
    > $exp/test-$epoch.log
