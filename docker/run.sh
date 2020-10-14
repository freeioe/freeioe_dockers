#!/bin/sh

NAME="FreeIOE"
DESC="FreeIOE based on skynet"

BASE_DIR=/usr/ioe
SKYNET_DIR=$BASE_DIR/skynet
FREEIOE_DIR=$SKYNET_DIR/ioe

SKYNET_BIN=$SKYNET_DIR/skynet
STARTUP_SH=$FREEIOE_DIR/startup.sh

ARCH=`arch`
PID=/var/run/skynet.pid
DAEMON=process-monitor

if [ -f /etc/default/skynet ]; then
        . /etc/default/skynet
fi

DAEMON_OPTS="-p $PID -M 2 -D $SKYNET_DIR"
STARTUP_OPTS="sh $STARTUP_SH $BASE_DIR"

export IOE_RUN_AS_DAEMON=1

echo "Starting..." $DESC
$DAEMON $DAEMON_OPTS -S "$STARTUP_OPTS" $SKYNET_BIN ioe/config
