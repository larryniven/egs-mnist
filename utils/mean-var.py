#!/usr/bin/env python3

import sys
import json

area = 'head'

mean = []
var = []
count = 0

for line in sys.stdin:
    if area == 'head':
        area = 'body'

    elif area == 'body' and line == '.\n':
        area = 'head'

    elif area == 'body':
        parts = line.split()

        while len(mean) < len(parts):
            mean.append(0)
            var.append(0)

        for i, e in enumerate(parts):
            v = float(e)
            mean[i] += v
            var[i] += v * v

        count += 1

for i, e in enumerate(mean):
    mean[i] /= count

for i, e in enumerate(mean):
    var[i] /= count
    var[i] -= mean[i] * mean[i]

print(json.dumps(mean))
print(json.dumps(var))
