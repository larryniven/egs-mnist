#!/usr/bin/env python3

import sys

f = open(sys.argv[1], 'rb')

f.read(4 + 4)

i = 0
while f.readable():
    ell = f.read(1)
    if not ell:
        break
    print('{}.label'.format(i))
    print(ell[0])
    print('.')
    i += 1
