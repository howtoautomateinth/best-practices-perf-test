FROM grafana/grafana:latest
ADD grafana.ini /etc/grafana/grafana.ini
ADD influxdb.yaml /etc/grafana/provisioning/datasources/influxdb.yaml
ADD dashboard.yaml /etc/grafana/provisioning/dashboards/dashboard.yaml
ADD ./dashboard/* /var/lib/grafana/dashboards/test_insert_dashboard.json
ADD run.sh /run.sh

ENTRYPOINT ["/bin/bash"]
CMD ["/run.sh"]

