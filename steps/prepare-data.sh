#!/bin/bash

. ./path.sh

mkdir data
cd data

utils=../utils

echo "download data set"

wget http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz
wget http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz
wget http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz
wget http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz

gunzip train-images-idx3-ubyte
gunzip train-labels-idx1-ubyte
gunzip t10k-images-idx3-ubyte
gunzip t10k-labels-idx1-ubyte

echo "convert data to batch formats"

$utils/read-mnist-images.py < train-images-idx3-ubyte > train.bimg
$utils/read-mnist-labels.py < train-labels-idx1-ubyte > train.blabel
$utils/read-mnist-images.py < t10k-images-idx3-ubyte > test.bimg
$utils/read-mnist-labels.py < t10k-labels-idx1-ubyte > test.blabel

echo "mean and variance normalization"

$utils/mean-var.py < train.bimg > train.bimg.mean-var
$utils/mean-var-norm.py train.bimg.mean-var < train.bimg > train-norm.bimg
$utils/mean-var-norm.py train.bimg.mean-var < test.bimg > test-norm.bimg

cd ..

$dist/batch-utils/batch2scp.py data/train-norm.bimg > data/train-norm.bimg.scp
$dist/batch-utils/batch2scp.py data/train.blabel > data/train.blabel
$dist/batch-utils/batch2scp.py data/test-norm.bimg > data/test-norm.bimg.scp
$dist/batch-utils/batch2scp.py data/test.blabel > data/test.blabel

echo "done"
