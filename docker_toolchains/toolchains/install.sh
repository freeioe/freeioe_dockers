#!/bin/sh

set -e

# chmod a+x *.sh
CUR_DIR=`pwd`

# TGW 3030 (Q102)
echo "TGW 3030 Toolchain"
cd ${CUR_DIR}/tgw3030
tar -xjf lede-toolchain-imx6-tch-TGW3030_gcc-5.4.0_musl-1.1.16_eabi.Linux-x86_64.tar.bz2
rm -f lede-toolchain-imx6-tch-TGW3030_gcc-5.4.0_musl-1.1.16_eabi.Linux-x86_64.tar.bz2
cp -f iconv.h lede-toolchain-imx6-tch-TGW3030_gcc-5.4.0_musl-1.1.16_eabi.Linux-x86_64/toolchain-arm_cortex-a9+neon_gcc-5.4.0_musl-1.1.16_eabi/include
cp -f libiconv.a lede-toolchain-imx6-tch-TGW3030_gcc-5.4.0_musl-1.1.16_eabi.Linux-x86_64/toolchain-arm_cortex-a9+neon_gcc-5.4.0_musl-1.1.16_eabi/lib
cd stage_dir
tar -xjf usr.tar.bz2
rm -f usr.tar.bz2

# SUNXI A7 (X1) 19.07
echo "Sunxi A7 Toolchain(19.07)"
cd ${CUR_DIR}/sunxi_a7_19.07
tar -xjf openwrt-toolchain-sunxi-cortexa7_gcc-7.4.0_musl_eabi.Linux-x86_64.tar.bz2
rm -f openwrt-toolchain-sunxi-cortexa7_gcc-7.4.0_musl_eabi.Linux-x86_64.tar.bz2
tar -xJf staging_dir.tar.xz
rm -f staging_dir.tar.xz
cd staging_dir
cp -f target-arm_cortex-a7+neon-vfpv4_musl_eabi/usr/lib/libiconv-full-full/include/iconv.h ../openwrt-toolchain-sunxi-cortexa7_gcc-7.4.0_musl_eabi.Linux-x86_64/toolchain-arm_cortex-a7+neon-vfpv4_gcc-7.4.0_musl_eabi/include/
cp -f target-arm_cortex-a7+neon-vfpv4_musl_eabi/usr/lib/libiconv-full-full/include/*.a ../openwrt-toolchain-sunxi-cortexa7_gcc-7.4.0_musl_eabi.Linux-x86_64/toolchain-arm_cortex-a7+neon-vfpv4_gcc-7.4.0_musl_eabi/lib/

# SUNXI A7 (X1) Snapshot
echo "Sunxi A7 Toolchain(snapshot)"
cd ${CUR_DIR}/sunxi_a7_snapshot
tar -xjf openwrt-toolchain-sunxi-cortexa7_gcc-8.4.0_musl_eabi.Linux-x86_64.tar.bz2
rm -f openwrt-toolchain-sunxi-cortexa7_gcc-8.4.0_musl_eabi.Linux-x86_64.tar.bz2
tar -xJf staging_dir.tar.xz
rm -f staging_dir.tar.xz
cd staging_dir
cp -f target-arm_cortex-a7+neon-vfpv4_musl_eabi/usr/lib/libiconv-full-full/include/iconv.h ../openwrt-toolchain-sunxi-cortexa7_gcc-7.4.0_musl_eabi.Linux-x86_64/toolchain-arm_cortex-a7+neon-vfpv4_gcc-8.4.0_musl_eabi/include/
cp -f target-arm_cortex-a7+neon-vfpv4_musl_eabi/usr/lib/libiconv-full-full/include/*.a ../openwrt-toolchain-sunxi-cortexa7_gcc-7.4.0_musl_eabi.Linux-x86_64/toolchain-arm_cortex-a7+neon-vfpv4_gcc-8.4.0_musl_eabi/lib/

# RAMIPS MT7688 (C1) Snapshot
echo "Ramips MT7688 Toolchain(snapshot)"
cd ${CUR_DIR}/ramips_mt76x8
tar -xjf openwrt-toolchain-ramips-mt76x8_gcc-8.4.0_musl.Linux-x86_64.tar.bz2
rm -f openwrt-toolchain-ramips-mt76x8_gcc-8.4.0_musl.Linux-x86_64.tar.bz2
tar -xJf staging_dir.tar.xz
rm -f staging_dir.tar.xz
cd staging_dir
cp -f target-mipsel_24kc_musl/usr/lib/libiconv-full-full/include/iconv.h ../openwrt-toolchain-ramips-mt76x8_gcc-8.4.0_musl.Linux-x86_64/toolchain-mipsel_24kc_gcc-8.4.0_musl/include/
cp -f target-mipsel_24kc_musl/usr/lib/libiconv-full-full/include/iconv.h ../openwrt-toolchain-ramips-mt76x8_gcc-8.4.0_musl.Linux-x86_64/toolchain-mipsel_24kc_gcc-8.4.0_musl/lib/


# X86_64 19.07
echo "X86_64 Toolchain(19.07)"
cd ${CUR_DIR}/x86_64_glibc_19.07
tar -xjf openwrt-toolchain-x86-64_gcc-7.5.0_glibc.Linux-x86_64.tar.bz2
rm -f openwrt-toolchain-x86-64_gcc-7.5.0_glibc.Linux-x86_64.tar.bz2
cd staging_dir
tar -xJf target-x86_64_glibc.tar.xz
rm -f target-x86_64_glibc.tar.xz
cp -f target-x86_64_glibc/usr/lib/libiconv-full-full/include/iconv.h ../openwrt-toolchain-x86-64_gcc-7.5.0_glibc.Linux-x86_64/toolchain-x86_64_gcc-7.5.0_glibc/include/
cp -f target-x86_64_glibc/usr/lib/libiconv-full-full/lib/*.a ../openwrt-toolchain-x86-64_gcc-7.5.0_glibc.Linux-x86_64/toolchain-x86_64_gcc-7.5.0_glibc/lib/
