#! /bin/sh
cd wiremock
filename="wiremock.jar"
if [ -e $filename ]
then
	java -jar wiremock.jar --verbose
else
	echo 'start downloading mock'
	wget -O wiremock.jar http://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/2.14.0/wiremock-standalone-2.14.0.jar
	java -jar wiremock.jar --verbose
fi
