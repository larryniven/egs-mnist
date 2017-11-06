#!/usr/bin/env python3

import sys
import json
import random
import math
from nninit import gen_mat, gen_vec

zero = lambda d: 0.0

if len(sys.argv) > 1 and sys.argv[1] == 'random':
    gen = lambda d: random.uniform(-math.sqrt(6 / d), math.sqrt(6 / d))
    ggen = lambda z: lambda d: random.uniform(-math.sqrt(6 / z), math.sqrt(6 / z))
else:
    gen = lambda d: 0.0
    ggen = lambda z: lambda d: 0.0

print(2)
gen_mat(28 * 28, 800, gen)
gen_vec(800, zero)
gen_mat(800, 10, gen)
gen_vec(10, zero)
