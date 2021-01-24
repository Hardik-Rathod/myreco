#!/bin/bash

# Enumerate subdomain using subfinder

mkdir $1

cd $1

subfinder -d $1 -o $1-sub.txt

sort -u $1-sub.txt | httprobe > $1-subuniq.txt

# capture screenshots using gowitness

gowitness file -f $1-subuniq.txt --threads=4

# merge all ss in 1 file and check in browser

cd screenshots

for I in $(ls); do 
        echo "$I" >> index.html;
        echo "<img src=$I><br>" >> index.html;
done