#!/usr/bin/env python3

import sys
import json
import math

f = open(sys.argv[1])

mean = json.loads(f.readline())
var = json.loads(f.readline())

f.close()

area = 'head'

for line in sys.stdin:
    if area == 'head':
        area = 'body'

        print(line, end='')

    elif area == 'body' and line == '.\n':
        area = 'head'

        print(line, end='')

    elif area == 'body':
        parts = line.split()

        v = []
        for i, e in enumerate(parts):
            if var[i] == 0:
                v.append(0.0)
            else:
                v.append((float(e) - mean[i]) / math.sqrt(var[i]))

        print(' '.join([str(e) for e in v]))
