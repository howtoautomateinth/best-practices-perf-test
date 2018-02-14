# Best Practices to playing with performance testing
Demonstrate how to do a performance testing with monitoring dashboard in one click!

To illustrate the testing result real time Docker Compose file consist of
- Gatling
- Grafana
- Influxdb
- Chronograf
- Wiremock

## How to run
`./start-services.sh`
and waiting for build docker image locally and some other stuff

## How to monitor
Grafana
`http://localhost:30000`
Check existing dashboard to see a result

Chronograf
`http://localhost:38888`
To verify data that wrote in influxdb via Graphite protocol

## How to modify test script
Modified the existing one at 
`https://github.com/howtoautomateinth/best-practices-perf-test/tree/master/gatling/2.3.0/simulations/sample`
or add new gatling test scenario here

FYI: that volume mounted in docker compose so it will automatically use when docker compose up but don't forget to change docker command in docker compose from 
`[-s, sample.WiremockService]`
to
`[-s, sample.YourOwnServicesTest]`

## Need more mock endpoint
Modified the existing one at 
`https://github.com/howtoautomateinth/best-practices-perf-test/tree/master/wiremock/mappings`
or add new mocking response here 

