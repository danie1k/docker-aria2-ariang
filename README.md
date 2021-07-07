[![Lint](https://github.com/danie1k/docker-aria2-ariang/actions/workflows/lint.yml/badge.svg)](https://github.com/danie1k/docker-aria2-ariang/actions/workflows/lint.yml)
[![Build Docker Image](https://github.com/danie1k/docker-aria2-ariang/actions/workflows/build-docker-image.yml/badge.svg)](https://github.com/danie1k/docker-aria2-ariang/actions/workflows/build-docker-image.yml)
[![Docker Image Version](https://img.shields.io/docker/v/danie1k/aria2-ariang)](https://hub.docker.com/repository/docker/danie1k/aria2-ariang)
[![GPL-3.0 License](https://img.shields.io/github/license/danie1k/docker-aria2-ariang)](https://github.com/danie1k/docker-aria2-ariang/blob/master/LICENSE)

# Aria2 + AriaNG

[aria2] + [AriaNg] based on [Alpine Linux container] provided by [Linuxserver.io].


## Environment Variables

Container can be configured using environment variables passed at runtime.

### Container Parameters

| Variable Name | Description                                                        |
| ------------- | ------------------------------------------------------------------ |
| `AUTH`        | Basic HTTP auth for AriaNG `username:password`, no auth by default |
| `PUID`        | User ID - see below for explanation                                |
| `PGID`        | Group ID - see below for explanation                               |
| `TZ`          | A timezone to use                                                  |
| `UMASK`       | Umask for running applications                                     |

### Aria2 Parameters

| Variable Name                  | [aria2c] option              | Default Value |
| ------------------------------ | ---------------------------- | ------------- |
| `aria2BtLoadSavedMetadata`     | `bt-load-saved-metadata`     | false         |
| `aria2BtMinCryptoLevel`        | `bt-min-crypto-level`        | plain         |
| `aria2BtRequireCrypto`         | `bt-require-crypto`          | false         |
| `aria2BtSaveMetadata`          | `bt-save-metadata`           | false         |
| `aria2ConsoleLogLevel`         | `console-log-level`          | warn          |
| `aria2Continue`                | `continue`                   | false         |
| `aria2DhtListenPort`           | `dht-listen-port`            | 6881-6999     |
| `aria2DisableIpv6`             | `disable-ipv6`               | true          |
| `aria2EnableDht`               | `enable-dht`                 | true          |
| `aria2ForceSave`               | `force-save`                 | false         |
| `aria2ListenPort`              | `listen-port`                | 6881-6999     |
| `aria2LogLevel`                | `log-level`                  | warn          |
| `aria2MaxConcurrentDownloads`  | `max-concurrent-downloads`   | 5             |
| `aria2MaxConnectionPerServer`  | `max-connection-per-server`  | 1             |
| `aria2MaxDownloadLimit`        | `max-download-limit`         | 0             |
| `aria2MaxOverallDownloadLimit` | `max-overall-download-limit` | 0             |
| `aria2MinSplitSize`            | `min-split-size`             | 20M           |
| `aria2SaveSessionInterval`     | `save-session-interval`      | 0             |
| `aria2Secret`                  | `rpc-secret`                 | 0hb!lly       |
| `aria2SeedRatio`               | `seed-ratio`                 | 1.0           |
| `aria2SeedTime`                | `seed-time`                  | 0             |
| `aria2Split`                   | `split`                      | 5             |


## License

[GPL-3.0](./LICENSE)


[Alpine Linux container]: https://github.com/linuxserver/docker-baseimage-alpine
[AriaNg]: https://github.com/mayswind/AriaNg/
[Linuxserver.io]: https://www.linuxserver.io/
[aria2]: https://aria2.github.io/
[aria2c]: https://aria2.github.io/manual/en/html/aria2c.html
