#!/bin/bash
# Resolves DNS names into IP Addresses.
# Feel free to modify this file as you wish, if you can make it better. I Always Love improvements!
# By L1nyxL0v3er @ https://0ffff7f000001ipv6literalnet.wordpress.com/

if [ -n "$1" ]; then
	file=$1
else
	file="servers.txt"
	echo "$file"
fi

if [ ! -f $file -o ! -r $file ]; then
	echo "error: unable to read $file."
	exit 1
fi

for server in $(grep -v '^#' $file)
do

echo "$server:$(ping -c 1 $server |head -n1|cut -d"(" -f2|cut -d")" -f1)"

done

