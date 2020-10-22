#!/bin/bash

set -e

mkdir -p /usr/ioe/ipt

if [ -f /usr/ioe_ipt/strip_done ]; then
	echo "File released!!"
else
	if [ -f /usr/ioe/skynet/cfg.json ]; then
		cp /usr/ioe/skynet/cfg.json /usr/ioe/ipt/
		cp /usr/ioe/skynet/cfg.json.md5 /usr/ioe/ipt/
	fi

	if [ -f /usr/ioe_ipt/freeioe.tar.gz ]; then
		mv -f /usr/ioe_ipt/freeioe.tar.gz* /usr/ioe/ipt/
		rm -rf /usr/ioe/freeioe
		mkdir -p /usr/ioe/freeioe
		tar -C /usr/ioe/freeioe -xzf /usr/ioe/ipt/freeioe.tar.gz
	fi
	if [ -f /usr/ioe_ipt/skynet.tar.gz ]; then
		mv -f /usr/ioe_ipt/skynet.tar.gz* /usr/ioe/ipt/
		rm -rf /usr/ioe/skynet
		mkdir -p /usr/ioe/skynet
		tar -C /usr/ioe/skynet -xzf /usr/ioe/ipt/skynet.tar.gz
		if [ -f /usr/ioe/ipt/cfg.json ]; then
			cp /usr/ioe/ipt/cfg.json* /usr/ioe/skynet/
		fi
	fi

	date > /usr/ioe_ipt/strip_done
fi

cd /usr/ioe/skynet

if [[ -z "$IOE_SN" ]]; then
	export IOE_SN="DOCKER_UNKNOWN_ID"
fi

echo "[system]" > /etc/ioe.ini
echo "sn="$IOE_SN >> /etc/ioe.ini

if [ "$1" = 'start' ]; then
	/run.sh
else
	bash
fi

