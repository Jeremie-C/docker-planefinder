#!/bin/sh
arch=$(dpkg --print-architecture)

case $arch in
  amd64)
    FILE="http://client.planefinder.net/pfclient_5.0.162_amd64.deb"
    ;;
  i386)
    FILE="http://client.planefinder.net/pfclient_5.0.161_i386.deb"
    ;;
  armhf)
    FILE="http://client.planefinder.net/pfclient_5.0.161_armhf.deb"
    ;;
  arm64)
    dpkg --add-architecture armhf
    apt-get update
    apt-get install --no-install-recommends -y libc6:armhf
    FILE="http://client.planefinder.net/pfclient_5.0.161_armhf.deb"
    ;;
  armel)
    dpkg --add-architecture armhf
    apt-get update
    apt-get install --no-install-recommends -y libc6:armhf
    FILE="http://client.planefinder.net/pfclient_5.0.161_armhf.deb"
    ;;
  *)
    exit 1
    ;;
esac

wget -O /tmp/pfclient.deb "${FILE}"
dpkg --install /tmp/pfclient.deb
kill -9 "$(cat /run/pfclient.pid)"
