FROM dockerfile/java:oracle-java7

MAINTAINER Kamil Manka <kamil.manka@gmail.com>

ENV YOUTRACK_VERSION 6.0.12463
RUN mkdir -p /opt/youtrack
RUN wget -nv http://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.jar -O /opt/youtrack/youtrack-$YOUTRACK_VERSION.jar
RUN ln -s /opt/youtrack/youtrack-$YOUTRACK_VERSION.jar /opt/youtrack/youtrack.jar

WORKDIR /opt/youtrack

ADD youtrack_run.sh /opt/youtrack/
ADD log4j.xml /opt/youtrack/
RUN chmod o+rx youtrack_run.sh

EXPOSE 8080
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/root"]

CMD ["./youtrack_run.sh"]