#!/bin/bash

rm toolchains.tar

tar -cvf toolchains.tar toolchains

scp toolchains.tar kooiot.com:/var/www/openwrt/download/toolchains/toolchains.tar
