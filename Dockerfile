FROM debian:buster-slim

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    BEAST_PORT=30005

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

COPY rootfs/ /

RUN apt-get update && apt-get upgrade -y && \
  apt-get install -y --no-install-recommends \
  # S6 Install
  ca-certificates wget \
  # Required for build
  file gnupg \  
  # Required always
  jq net-tools procps libc6 lsb-base && \
  # Sripts
  chmod +x /scripts/*.sh && \
  chmod +x /healthcheck.sh && \
  # S6 OVERLAY
  /scripts/s6-overlay.sh && \
  # PFClient
  /scripts/arch-specific.sh && \
  dpkg --install /tmp/pfclient.deb && \
  rm -rf /var/log/pfclient/* /etc/pfclient-config.json && \
  # Cleanup
  apt-get remove -y file gnupg && \
  apt-get autoremove -y && \
  rm -rf /tmp/* /scripts /var/lib/apt/lists/*

ENTRYPOINT ["/init"]
EXPOSE 30053
HEALTHCHECK --start-period=60s --interval=300s CMD /healthcheck.sh
LABEL maintainer="Jeremie-C <Jeremie-C@users.noreply.github.com>"
