#!/usr/bin/env bash
file=/config/rss_memory.txt

if [ ! -e "${file}" ]; then
  touch "${file}"
fi

while read -r p; do
  if [[ "${p}" =~ ^#.* ]]; then
    echo "${p}"
  else
    curl "${p}" | grep -o '<link>.*torrent</link>' | sed -e 's/<[^>]*>//g' | while read -r line; do
      if grep -Fxq "${line}" "${file}"; then
        echo Exist already: "${line}"
      else
        ruby /config/aria2rpc.ruby --server 127.0.0.1 --port 6800 --secret '{{ default .Env.aria2Secret "0hb!lly" }}' addUri "${line}"
        echo "${line}" >>"${file}"
      fi
    done
    sleep 2
  fi
done </config/rss_feeds.txt
