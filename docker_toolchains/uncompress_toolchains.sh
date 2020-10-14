#!/bin/sh

set -e

cd /toolchains
chmod a+x *.sh

# TGW 3030 (Q102)
echo "TGW 3030 Toolchain"
cd /toolchains/tgw3030
tar -xjf lede-toolchain-imx6-tch-TGW3030_gcc-5.4.0_musl-1.1.16_eabi.Linux-x86_64.tar.bz2
rm -f lede-toolchain-imx6-tch-TGW3030_gcc-5.4.0_musl-1.1.16_eabi.Linux-x86_64.tar.bz2
cd stage_dir
tar -xjf usr.tar.bz2
rm -f usr.tar.bz2

# SUNXI A7 (X1) 19.07
echo "Sunxi A7 Toolchain(19.07)"
cd /toolchains/sunxi_a7_19.07
tar -xjf openwrt-toolchain-sunxi-cortexa7_gcc-7.4.0_musl_eabi.Linux-x86_64.tar.bz2
rm -f openwrt-toolchain-sunxi-cortexa7_gcc-7.4.0_musl_eabi.Linux-x86_64.tar.bz2
tar -xJf staging_dir.tar.xz
rm -f staging_dir.tar.xz

# SUNXI A7 (X1) Snapshot
echo "Sunxi A7 Toolchain(snapshot)"
cd /toolchains/sunxi_a7_snapshot
tar -xjf openwrt-toolchain-sunxi-cortexa7_gcc-8.4.0_musl_eabi.Linux-x86_64.tar.bz2
rm -f openwrt-toolchain-sunxi-cortexa7_gcc-8.4.0_musl_eabi.Linux-x86_64.tar.bz2
tar -xJf staging_dir.tar.xz
rm -f staging_dir.tar.xz

# RAMIPS MT7688 (C1) Snapshot
echo "Ramips MT7688 Toolchain(snapshot)"
cd /toolchains/ramips_mt76x8
tar -xjf openwrt-toolchain-ramips-mt76x8_gcc-8.4.0_musl.Linux-x86_64.tar.bz2
rm -f openwrt-toolchain-ramips-mt76x8_gcc-8.4.0_musl.Linux-x86_64.tar.bz2
tar -xJf staging_dir.tar.xz
rm -f staging_dir.tar.xz


# X86_64 19.07
echo "X86_64 Toolchain(19.07)"
cd /toolchains/x86_64_glibc_19.07
tar -xjf openwrt-toolchain-x86-64_gcc-7.4.0_glibc.Linux-x86_64.tar.bz2
rm -f openwrt-toolchain-x86-64_gcc-7.4.0_glibc.Linux-x86_64.tar.bz2
cd staging_dir
tar -xJf target-x86_64_glibc.tar.xz
rm -f target-x86_64_glibc.tar.xz

