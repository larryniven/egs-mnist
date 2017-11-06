#!/usr/bin/env python3

import sys

pred = open(sys.argv[1])
gold = open(sys.argv[2])

error = 0
total = 0

area = 'head'
for p, g in zip(pred, gold):
    if area == 'head':
        area = 'body'

    elif area == 'body' and p == '.\n':
        area = 'head'

    elif area == 'body':
        if p != g:
            error += 1
        total += 1

print('error: {} total: {} rate: {}'.format(error, total, error / total))
