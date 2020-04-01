#!/usr/bin/env bash
killall -q polybar

polybar main >> /tmp/polybar1.log 2>&1 &
polybar main-external >> /tmp/polybar2.log 2>&1 &
echo "-- POLYBAR LAUNCHED --"
