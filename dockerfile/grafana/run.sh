#!/bin/bash -e

# Fix for folder access issue when doing volumes to the host
userdel grafana
groupadd -g 1000 grafana
useradd -M -d /usr/share/grafana -u 1000 -g 1000 -s /bin/false grafana

: "${GF_PATHS_CONFIG:=/etc/grafana/grafana.ini}"
: "${GF_PATHS_DATA:=/var/lib/grafana}"
: "${GF_PATHS_LOGS:=/var/log/grafana}"
: "${GF_PATHS_PLUGINS:=/var/lib/grafana/plugins}"
: "${GF_PATHS_PROVISIONING:=/etc/grafana/provisioning}"

chown -R grafana:grafana "$GF_PATHS_DATA" "$GF_PATHS_LOGS"
chown -R grafana:grafana /etc/grafana

exec gosu grafana /usr/sbin/grafana-server				\
  --homepath=/usr/share/grafana							\
  --config="$GF_PATHS_CONFIG"							\
  cfg:default.log.mode="console"						\
  cfg:default.paths.data="$GF_PATHS_DATA"				\
  cfg:default.paths.logs="$GF_PATHS_LOGS"				\
  cfg:default.paths.plugins="$GF_PATHS_PLUGINS"			\
  cfg:default.paths.provisioning=$GF_PATHS_PROVISIONING	\
  "$@"