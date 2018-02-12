FROM influxdb:1.3-alpine
ADD influxdb.conf /etc/influxdb/influxdb.conf
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd"]