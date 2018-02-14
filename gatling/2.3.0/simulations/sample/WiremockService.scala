package sample

import scala.concurrent.duration._
import io.gatling.core.Predef._
import io.gatling.http.Predef._
import io.gatling.jdbc.Predef._
import java.net.InetAddress

class WiremockService extends Simulation {

	val httpProtocol = http
		.baseURL("http://wiremock-standalone:8080")
		.acceptHeader("*/*")

  val myaddress = InetAddress.getLocalHost.toString

	val scn = scenario("Send request to wiremock")
		.exec(http(myaddress).get("/home"))

	setUp(
    scn.inject(
		constantUsersPerSec(2) during(100 minutes)
    )
  ).protocols(httpProtocol)
}
