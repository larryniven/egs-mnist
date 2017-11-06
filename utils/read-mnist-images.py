#!/usr/bin/env python3

import sys

f = open(sys.argv[1], 'rb')

f.read(4 + 4 + 4 + 4)

i = 0
while f.readable():
    vec = f.read(784)
    if not vec:
        break
    print('{}.digit'.format(i))
    print(' '.join([str(e) for e in vec]))
    print('.')
    i += 1
