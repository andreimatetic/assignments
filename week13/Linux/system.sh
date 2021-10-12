#!/bin/bash

# Free memory output to a free_mem.txt file
free -ht > ~/backups/freemem/free_mem.txt

# Disk usage output to a disk_usage.txt file
# -h human readable '-d 1' depth 1
# --exclude= ... they're virtual so no sense in listing
du -h --exclude={proc,dev,sys} / -d 1 > ~/backups/diskuse/disk_usage.txt

# List open files to a open_list.txt file
lsof > ~/backups/openlist/open_list.txt

# Free disk space to a free_disk.txt file
df -h > ~/backups/freedisk/free_disk.txt
