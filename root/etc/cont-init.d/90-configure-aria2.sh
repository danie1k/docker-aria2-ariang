#!/usr/bin/with-contenv bash
set -e

mkdir -p /config /download

dockerize -template /defaults/aria2.conf:/config/aria2.conf
dockerize -no-overwrite -template /defaults/aria2_ext.conf:/config/aria2_ext.conf
dockerize -no-overwrite -template /defaults/on-bt-download-complete.sh:/config/on-bt-download-complete.sh
dockerize -no-overwrite -template /defaults/on-download-complete.sh:/config/on-download-complete.sh
dockerize -no-overwrite -template /defaults/on-download-error.sh:/config/on-download-error.sh
dockerize -no-overwrite -template /defaults/on-download-pause.sh:/config/on-download-pause.sh
dockerize -no-overwrite -template /defaults/on-download-start.sh:/config/on-download-start.sh
dockerize -no-overwrite -template /defaults/on-download-stop.sh:/config/on-download-stop.sh

dockerize -template /defaults/aria2rpc.ruby:/config/aria2rpc.ruby
dockerize -template /defaults/rss_download.sh:/config/rss_download.sh
dockerize -no-overwrite -template /defaults/rss_feeds.txt:/config/rss_feeds.txt

cat /config/aria2_ext.conf >> /config/aria2.conf

if [[ ! -f /config/aria2.session ]]; then
  touch /config/aria2.session
fi

chmod +x /config/*.sh /config/*.ruby

chown -R abc:abc /config /download
