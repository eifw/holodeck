#!/usr/bin/env bash

if [ "$AXIS_PORT" != "" ]; then
	/usr/bin/xsltproc --param port $AXIS_PORT /opt/holodeck/bin/setWSPort.xsl /opt/holodeck/conf/axis2.xml > /opt/holodeck/conf/axis2_out.xml
	mv /opt/holodeck/conf/axis2_out.xml /opt/holodeck/conf/axis2.xml
fi

if [ "$ROLE" != "" ]; then
	if [ "${ROLE,,}" == "receiver" ]; then
		/bin/cp /opt/holodeck/examples/pmodes/ex-pm-push-resp.xml /opt/holodeck/conf/pmodes/.
	fi

	if [ "${ROLE,,}" == "sender" ]; then
		if [ "$RECEIVING_MSH_HOST" != "" ]; then
			/usr/bin/xsltproc --stringparam receiverHost $RECEIVING_MSH_HOST /opt/holodeck/bin/setReceiver.xsl /opt/holodeck/examples/pmodes/ex-pm-push-init.xml  > /opt/holodeck/examples/pmodes/ex-pm-push-init-sender.xml
			/bin/cp /opt/holodeck/examples/pmodes/ex-pm-push-init-sender.xml /opt/holodeck/conf/pmodes/ex-pm-push-init.xml
		else
			/bin/cp /opt/holodeck/examples/pmodes/ex-pm-push-init.xml /opt/holodeck/conf/pmodes/.
		fi
	fi
fi

sh /opt/holodeck/bin/startServer.sh
