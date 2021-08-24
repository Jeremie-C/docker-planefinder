# docker-planefinder

![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/jeremiec82/planefinder?style=plastic)
![Docker Pulls](https://img.shields.io/docker/pulls/jeremiec82/planefinder?style=plastic)
[![Deploy to Docker Hub](https://github.com/Jeremie-C/docker-planefinder/actions/workflows/deploy.yml/badge.svg)](https://github.com/Jeremie-C/docker-planefinder/actions/workflows/deploy.yml)
[![Check Code](https://github.com/Jeremie-C/docker-planefinder/actions/workflows/check_code.yml/badge.svg)](https://github.com/Jeremie-C/docker-planefinder/actions/workflows/check_code.yml)
[![Docker Build](https://github.com/Jeremie-C/docker-planefinder/actions/workflows/test_build.yml/badge.svg)](https://github.com/Jeremie-C/docker-planefinder/actions/workflows/test_build.yml)

Share your ADS-B data to planefinder

## Environment Variables

| Environment Variable | Purpose | Default |
| -------------------- | ------- | ------- |
| `BEAST_HOST` | Required. IP/Hostname of a Mode-S/BEAST provider (readsb) | |
| `BEAST_PORT` | Optional. TCP port number of Mode-S/BEAST provider (readsb) | `30005` |
| `SHARECODE`  | Required. Your Planefinder Sharecode |  |
| `LATITUDE`   | Required. The latitude of the antenna |  |
| `LONGITUDE`  | Required. The longitude of the antenna |  |
| `TZ`         | Optional. Your local timezone | `GMT` |

## Ports

| Port | Detail |
| ---- | ------ |
| 30053/tcp | Optional. Planefinder client web interface |
