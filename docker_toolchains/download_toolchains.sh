#!/bin/sh

set -e

TL_DIR="/toolchains"

DL_VER="toolchain_v1"
DL_URL="https://github.com/freeioe/freeioe_dockers/releases/download/"${DL_VER}
DL_FILE="toolchains.tar"

mkdir ${TL_DIR}
cd ${TL_DIR}

wget ${DL_URL}/${DL_FILE} -O ${DL_FILE}

tar xvf ${DL_FILE}
rm ${DL_FILE}
