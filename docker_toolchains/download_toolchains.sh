#!/bin/sh

set -e

TL_DIR="/"

DL_VER="toolchain_latest"
DL_URL="https://github.com/freeioe/freeioe_dockers/releases/download/"${DL_VER}
DL_FILE="toolchains.tar"

mkdir -p ${TL_DIR}
cd ${TL_DIR}

wget  -O ${DL_FILE} ${DL_URL}/${DL_FILE}

tar xvf ${DL_FILE}
rm ${DL_FILE}
