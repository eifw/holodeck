FROM anapsix/alpine-java:7

COPY holodeck /opt/holodeck
COPY config/init.sh /opt/holodeck/bin/
COPY config/setWSPort.xsl /opt/holodeck/bin
COPY config/setReceiver.xsl /opt/holodeck/bin

RUN /sbin/apk update && /sbin/apk add libxslt && \
	/bin/mkdir /opt/holodeck/conf/pmodes && \
	/bin/chmod 750 /opt/holodeck/bin/init.sh

VOLUME /opt/holodeck/conf
VOLUME /opt/holodeck/data
EXPOSE 8080
EXPOSE 9090

ENTRYPOINT ["/opt/holodeck/bin/init.sh"]

CMD []
