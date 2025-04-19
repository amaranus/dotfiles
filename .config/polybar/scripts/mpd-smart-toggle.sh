#!/bin/bash

lines=$(mpc status | wc -l)

# Eğer yalnızca 1 satır varsa, çalmıyor (stopped)
if [ "$lines" -le 1 ]; then
    mpc play
fi
