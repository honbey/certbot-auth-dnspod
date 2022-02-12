#!/usr/bin/env bash

# 0 2 1 * * /path/certbot_renew.sh >> /opt/web/logs/ddns/certbot-renew.log 2>&1

# certbot certonly --manual --preferred-challenges dns-01 --email r@honbey.com -d 'freewisdom.cn' -d '*.freewisdom.cn' --server https://acme-v02.api.letsencrypt.org/directory --manual-auth-hook /opt/zhang/certbot-auth-dnspod/certbot-auth-dnspod.sh --manual-cleanup-hook "/opt/zhang/certbot-auth-dnspod/certbot-auth-dnspod.sh clean" --config-dir /opt/zhang/letsencrypt --work-dir /opt/zhang/letsencrypt --logs-dir /opt/zhang/logs/letsencrypt/

date

/opt/zhang/pyvenv/certbot/bin/certbot renew \
  --manual-auth-hook /opt/zhang/certbot-auth-dnspod/certbot-auth-dnspod.sh \
  --manual-cleanup-hook "/opt/zhang/certbot-auth-dnspod/certbot-auth-dnspod.sh clean" \
  --config-dir /opt/zhang/letsencrypt \
  --work-dir /opt/zhang/letsencrypt \
  --logs-dir /opt/zhang/logs/letsencrypt

/usr/local/nginx-quic/sbin/nginx -s reload
