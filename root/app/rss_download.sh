#!/bin/sh
while read p; do
   curl $p | grep -o '<link>.*torrent</link>' | sed -e 's/<[^>]*>//g' | while read line
   do
     #echo $line
     ruby /config/aria2rpc.ruby --server 127.0.0.1 --port 6800 --secret YOUR_SECRET_CODE addUri $line
   done
done </conf/rss_feeds.txt
