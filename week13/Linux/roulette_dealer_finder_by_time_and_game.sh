#!/bin/bash

# roulette_dealer_finder_by_time_and_game.sh
# $0 - this script
# $1 - 4 digit date (e.g. 0310)
# $2 - 2 digit hour (e.g. 05)
# $3 - AM/PM indicator (e.g. AM)

# this is a little clunky, but directly addresses the field w/o having to do math
# $4  - GAME ID  
#       2 -> BlackJack
#	3 -> Roulette
#	4 -> Texas_Hold_EM

# borrowed a bit from 
# How do I use shell variables in an awk script?
# https://stackoverflow.com/questions/19075671/how-do-i-use-shell-variables-in-an-awk-script

grep $2 $1_Dealer_schedule | grep $3 | awk -v gid="$4" -F"\t" '{print $gid}'
