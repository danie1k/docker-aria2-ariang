#!/usr/bin/with-contenv bash
set -ex

mkdir -p /config /download

dockerize -template /default/aria2.conf:/config/aria2.conf
dockerize -no-overwrite -template /default/aria2_ext.conf:/config/aria2_ext.conf
dockerize -no-overwrite -template /default/on-bt-download-complete.sh:/config/on-bt-download-complete.sh
dockerize -no-overwrite -template /default/on-download-complete.sh:/config/on-download-complete.sh
dockerize -no-overwrite -template /default/on-download-error.sh:/config/on-download-error.sh
dockerize -no-overwrite -template /default/on-download-pause.sh:/config/on-download-pause.sh
dockerize -no-overwrite -template /default/on-download-start.sh:/config/on-download-start.sh
dockerize -no-overwrite -template /default/on-download-stop.sh:/config/on-download-stop.sh

dockerize -template /default/aria2rpc.ruby:/config/aria2rpc.ruby
dockerize -template /default/rss_download.sh:/config/rss_download.sh
dockerize -no-overwrite -template /default/rss_feeds.txt:/config/rss_feeds.txt

cat /config/aria2_ext.conf >> /config/aria2.conf

if [[ ! -f /config/aria2.session ]]; then
  touch /config/aria2.session
fi

chmod +x /config/*.sh /config/*.ruby

chown -R abc:abc /config /download
