#!/bin/bash

mkdir dist

cd dist

for d in autodiff batch-utils ebt la nn opt util mnist; do
    git clone https://github.com/larryniven/$d
    CXXFLAGS="-O3 -fopenmp" make -C $d
done

