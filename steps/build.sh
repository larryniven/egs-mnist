#!/bin/bash

mkdir dist

cd dist

git clone https://github.com/larryniven/mnist

CXXFLAGS="-O3 -fopenmp" make -C mnist
