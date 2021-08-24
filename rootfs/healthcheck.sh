#!/usr/bin/env bash
set -e
EXITCODE=0

wget -q -O /run/pfclient_stats.cur http://127.0.0.1:30053/ajax/stats

if [[ -e "/run/pfclient_stats.cur" ]]; then
  bytes_out_cur="$(jq .master_server_bytes_out < /run/pfclient_stats.cur)"
  bytes_out_old="$(jq .master_server_bytes_out < /run/pfclient_stats.old)"
  
  if [[ "$bytes_out_cur" -gt "$bytes_out_old" ]]; then
    echo "HEALTHY"
  else
    echo "UNHEALTHY"
    EXITCODE=1
  fi
fi

cp "/run/pfclient_stats.cur" "/run/pfclient_stats.old"

exit $EXITCODE
