TOOLCHAINS_PATH="/toolchains"

export STAGING_DIR="${TOOLCHAINS_PATH}/tgw3030/stage_dir"
export TOOLCHAIN_DIR="${TOOLCHAINS_PATH}/tgw3030/lede-toolchain-imx6-tch-TGW3030_gcc-5.4.0_musl-1.1.16_eabi.Linux-x86_64/toolchain-arm_cortex-a9+neon_gcc-5.4.0_musl-1.1.16_eabi"
export PATH="$TOOLCHAIN_DIR/bin:$PATH"

export TOOLCHAIN_ARCH=arm

export CC=$TOOLCHAIN_ARCH"-openwrt-linux-gcc"
export CXX=$TOOLCHAIN_ARCH"-openwrt-linux-g++"
export AR=$TOOLCHAIN_ARCH"-openwrt-linux-ar"
export STRIP=$TOOLCHAIN_ARCH"-openwrt-linux-strip"
