package sample

import scala.concurrent.duration._
import io.gatling.core.Predef._
import io.gatling.http.Predef._
import io.gatling.jdbc.Predef._
import java.net.InetAddress

class SampleService extends Simulation {

	val httpProtocol = http
		.baseURL("http://wiremock-standalone:8080")
		.acceptHeader("*/*")

  val myaddress = InetAddress.getLocalHost.toString

	val scn = scenario("Sample Service Root")
		.exec(http(myaddress).get("/home"))

	setUp(
    scn.inject(
			nothingFor(5 seconds),
			constantUsersPerSec(150) during(100 minutes)
    )
  ).protocols(httpProtocol)
}
