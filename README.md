[![Lint](https://github.com/danie1k/docker-aria2-ariang/actions/workflows/lint.yml/badge.svg)](https://github.com/danie1k/docker-aria2-ariang/actions/workflows/lint.yml)
[![Build Docker Image](https://github.com/danie1k/docker-aria2-ariang/actions/workflows/build-docker-image.yml/badge.svg)](https://github.com/danie1k/docker-aria2-ariang/actions/workflows/build-docker-image.yml)
[![Docker Image Version](https://img.shields.io/docker/v/danie1k/aria2-ariang)](https://hub.docker.com/repository/docker/danie1k/aria2-ariang)
[![GPL-3.0 License](https://img.shields.io/github/license/danie1k/docker-aria2-ariang)](https://github.com/danie1k/docker-aria2-ariang/blob/master/LICENSE)

# Aria2 + AriaNG

[aria2] + [AriaNg] based on Alpine Linux container.


## Environment Variables

Container can be configured using environment variables passed at runtime.

### Container Parameters

| Variable Name       | Description                                                        |
|---------------------|--------------------------------------------------------------------|
| `ARIA2_ARIANG_AUTH` | Basic HTTP auth for AriaNG `username:password`, no auth by default |
| `ARIA2_ARIANG_PORT` | HTTP Port for AriaNG web server. Default: `8080`                   |
| `PUID`              | User ID - see below for explanation                                |
| `PGID`              | Group ID - see below for explanation                               |
| `TZ`                | A timezone to use                                                  |
| `UMASK`             | Umask for running applications                                     |

### Aria2 Parameters

| Variable Name                   | [aria2c] option              | Default Value |
|---------------------------------| ---------------------------- | ------------- |
| `ARIA2_BtLoadSavedMetadata`     | `bt-load-saved-metadata`     | false         |
| `ARIA2_BtMinCryptoLevel`        | `bt-min-crypto-level`        | plain         |
| `ARIA2_BtRequireCrypto`         | `bt-require-crypto`          | false         |
| `ARIA2_BtSaveMetadata`          | `bt-save-metadata`           | false         |
| `ARIA2_ConsoleLogLevel`         | `console-log-level`          | warn          |
| `ARIA2_Continue`                | `continue`                   | false         |
| `ARIA2_DhtListenPort`           | `dht-listen-port`            | 6881-6999     |
| `ARIA2_DisableIpv6`             | `disable-ipv6`               | true          |
| `ARIA2_EnableDht`               | `enable-dht`                 | true          |
| `ARIA2_ForceSave`               | `force-save`                 | false         |
| `ARIA2_ListenPort`              | `listen-port`                | 6881-6999     |
| `ARIA2_LogLevel`                | `log-level`                  | warn          |
| `ARIA2_MaxConcurrentDownloads`  | `max-concurrent-downloads`   | 5             |
| `ARIA2_MaxConnectionPerServer`  | `max-connection-per-server`  | 1             |
| `ARIA2_MaxDownloadLimit`        | `max-download-limit`         | 0             |
| `ARIA2_MaxOverallDownloadLimit` | `max-overall-download-limit` | 0             |
| `ARIA2_MinSplitSize`            | `min-split-size`             | 20M           |
| `ARIA2_SaveSessionInterval`     | `save-session-interval`      | 0             |
| `ARIA2_Secret`                  | `rpc-secret`                 | 0hb!lly       |
| `ARIA2_SeedRatio`               | `seed-ratio`                 | 1.0           |
| `ARIA2_SeedTime`                | `seed-time`                  | 0             |
| `ARIA2_Split`                   | `split`                      | 5             |


## License

[GPL-3.0](./LICENSE)


[Alpine Linux container]: https://github.com/linuxserver/docker-baseimage-alpine
[AriaNg]: https://github.com/mayswind/AriaNg/
[Linuxserver.io]: https://www.linuxserver.io/
[aria2]: https://aria2.github.io/
[aria2c]: https://aria2.github.io/manual/en/html/aria2c.html
