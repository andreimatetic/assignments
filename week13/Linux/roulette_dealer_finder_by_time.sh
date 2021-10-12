#!/bin/bash

#
# $0 - this script
# $1 - 4 digit date (e.g. 0310)
# $2 - 2 digit hour (e.g. 05)
# $3 - AM/PM indicator (e.g. AM)

grep $2 $1_Dealer_schedule | grep $3 | awk -F"\t" '{print $3}'
