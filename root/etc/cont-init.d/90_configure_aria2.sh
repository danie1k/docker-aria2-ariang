#!/usr/bin/with-contenv bash

mkdir -p /config
mkdir -p /download

dockerize -template /app/start.sh:/config/start.sh
dockerize -template /app/aria2.conf:/config/aria2.conf
dockerize -no-overwrite -template /app/aria2_ext.conf:/config/aria2_ext.conf
dockerize -no-overwrite -template /app/on-bt-download-complete.sh:/config/on-bt-download-complete.sh
dockerize -no-overwrite -template /app/on-download-complete.sh:/config/on-download-complete.sh
dockerize -no-overwrite -template /app/on-download-error.sh:/config/on-download-error.sh
dockerize -no-overwrite -template /app/on-download-pause.sh:/config/on-download-pause.sh
dockerize -no-overwrite -template /app/on-download-start.sh:/config/on-download-start.sh
dockerize -no-overwrite -template /app/on-download-stop.sh:/config/on-download-stop.sh

dockerize -template /app/aria2rpc.ruby:/config/aria2rpc.ruby
dockerize -template /app/rss_download.sh:/config/rss_download.sh
dockerize -no-overwrite -template /app/rss_feeds.txt:/config/rss_feeds.txt

cat /config/aria2_ext.conf >> /config/aria2.conf

if [ ! -f /config/aria2.session ]; then
	touch /config/aria2.session
fi

chmod +x /config/start.sh
chmod +x /config/on-bt-download-complete.sh
chmod +x /config/on-download-complete.sh
chmod +x /config/on-download-error.sh
chmod +x /config/on-download-pause.sh
chmod +x /config/on-download-start.sh
chmod +x /config/on-download-stop.sh

chmod +x /config/aria2rpc.ruby
chmod +x /config/rss_download.sh
chmod +x /config/rss_download_wget.sh

chown -R app:users /download
chown -R app:users /config

#cat /config/aria2.conf
