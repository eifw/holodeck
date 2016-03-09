FROM alpine:3.2

ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre

COPY holodeck /opt/holodeck
COPY config/init.sh /opt/holodeck/bin/
COPY config/setWSPort.xsl /opt/holodeck/bin
COPY config/setReceiver.xsl /opt/holodeck/bin

RUN ["apk", "update"]
RUN ["apk", "add", "bash"]
RUN /sbin/apk update && /sbin/apk add libxslt openjdk7 && \
	/bin/mkdir /opt/holodeck/conf/pmodes /var/lib/holodeck && \
	/bin/chmod 750 /opt/holodeck/bin/init.sh
RUN ["/opt/holodeck/bin/init.sh"]

VOLUME /opt/holodeck/conf
VOLUME /opt/holodeck/data
VOLUME /var/lib/holodeck

ENV AXIS_PORT 8080

EXPOSE 8080

ENTRYPOINT ["/opt/holodeck/bin/startServer.sh"]

CMD []
