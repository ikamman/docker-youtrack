#!/bin/bash

exec java -Xmx1g -XX:MaxPermSize=250m -Djava.awt.headless=true -Djetbrains.mps.webr.log4jPath=/opt/youtrack/log4j.xml -jar youtrack.jar 8080
