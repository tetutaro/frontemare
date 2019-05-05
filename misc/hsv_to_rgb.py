#!/usr/bin/env python3
# -*- coding:utf-8 -*-
import sys
import colorsys

if len(sys.argv) != 4:
    print("Usage: hsv_to_rgb.py H S V")
    sys.exit(-1)

h_int = int(sys.argv[1])
s_int = int(sys.argv[2])
v_int = int(sys.argv[3])
h, s, v = (
    float(h_int) / 360,
    float(s_int) / 100,
    float(v_int) / 100
)
rgb = colorsys.hsv_to_rgb(h, s, v)
r_int = int(round((rgb[0] * 255)))
g_int = int(round((rgb[1] * 255)))
b_int = int(round((rgb[2] * 255)))
print('R:', r_int, 'G:', g_int, 'B:', b_int)
