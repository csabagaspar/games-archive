#!/bin/sh

cdemu unload 0
sleep 1s
cdemu load 0 ~/Games/janes-longbow-anthology/LBA_1.mds
sleep 1s
env LUTRIS_SKIP_INIT=1 lutris lutris:rungame/janes-longbow-anthology
