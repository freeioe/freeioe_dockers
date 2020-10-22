#!/bin/bash

set -e

mkdir -p /usr/ioe/ipt

uncompress_files() {
	# UnCompress FreeIOE
	if [ -f /usr/ioe_ipt/freeioe.tar.gz ]; then
		mkdir -p /usr/ioe/freeioe_new
		tar -C /usr/ioe/freeioe_new -xzf /usr/ioe_ipt/freeioe.tar.gz

		if [ -f /usr/ioe/freeioe/version ]; then
			IPT_VERSION=`head -n1 /usr/ioe/freeioe_new/version`
			INS_VERSION=`head -n1 /usr/ioe/freeioe/version`

			if [ ${IPT_VERSION} -gt ${INS_VERSION} ]; then
				rm -rf /usr/ioe/freeioe
				mv /usr/ioe/freeioe_new /usr/ioe/freeioe
				rm -f /usr/ioe/ipt/freeioe.tar.gz*
				cp /usr/ioe_ipt/freeioe.tar.gz* /usr/ioe/ipt/
			else
				rm -rf /usr/ioe/freeioe_new
			fi
		else
			mv /usr/ioe/freeioe_new /usr/ioe/freeioe
			rm -f /usr/ioe/ipt/freeioe.tar.gz*
			cp /usr/ioe_ipt/freeioe.tar.gz* /usr/ioe/ipt/
		fi
	fi

	# UnCompress Skynet
	if [ -f /usr/ioe_ipt/skynet.tar.gz ]; then
		mkdir -p /usr/ioe/skynet_new
		tar -C /usr/ioe/skynet -xzf /usr/ioe_ipt/skynet.tar.gz

		if [ -f /usr/ioe/skynet/cfg.json ]; then
			cp /usr/ioe/skynet/cfg.json /usr/ioe/skynet_new/
			cp /usr/ioe/skynet/cfg.json.md5 /usr/ioe/skynet_new/
		fi

		if [ -f /usr/ioe/skynet/version ]; then
			IPT_VERSION=`head -n1 /usr/ioe/skynet_new/version`
			INS_VERSION=`head -n1 /usr/ioe/skynet_new/version`

			if [ ${IPT_VERSION} -gt ${INS_VERSION} ]; then
				rm -rf /usr/ioe/skynet
				mv /usr/ioe/skynet_new /usr/ioe/skynet
				rm -f /usr/ioe/ipt/skynet.tar.gz*
				cp /usr/ioe_ipt/skynet.tar.gz* /usr/ioe/ipt/
			else
				rm -rf /usr/ioe/skynet_new
			fi
		else
			mv /usr/ioe/skynet_new /usr/ioe/skynet
			rm -f /usr/ioe/ipt/skynet.tar.gz*
			cp /usr/ioe_ipt/skynet.tar.gz* /usr/ioe/ipt/
		fi
	fi
}

uncompress_files

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

