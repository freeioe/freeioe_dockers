#!/bin/sh

set -e

TL_DIR="/"

DL_VER="toolchain_latest"
DL_URL="https://github.com/freeioe/freeioe_dockers/releases/download/"${DL_VER}
DL_FILE="toolchains.tar"

mkdir -p ${TL_DIR}
cd ${TL_DIR}

wget -nv -O ${DL_FILE} ${DL_URL}/${DL_FILE}
wget -nv -O ${DL_FILE}.md5 ${DL_URL}/${DL_FILE}.md5

md5sum -c ${DL_FILE}.md5

tar xvf ${DL_FILE}
rm ${DL_FILE}
