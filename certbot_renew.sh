#!/usr/bin/env bash

# 0 2 1 * * /path/certbot_renew.sh >> /opt/web/logs/ddns/certbot-renew.log 2>&1

date

/opt/data/pyvenv/certbot/bin/certbot renew \
  --manual-auth-hook /opt/data/certbot-auth-dnspod/certbot-auth-dnspod.sh \
  --manual-cleanup-hook "/opt/data/certbot-auth-dnspod/certbot-auth-dnspod.sh clean" \
  --config-dir /opt/data/letsencrypt \
  --work-dir /opt/data/letsencrypt \
  --logs-dir /opt/data/logs/letsencrypt

/usr/local/nginx-quic/sbin/nginx -s reload
