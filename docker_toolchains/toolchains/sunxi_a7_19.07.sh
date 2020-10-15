TOOLCHAINS_PATH="/toolchains"

export STAGING_DIR="${TOOLCHAINS_PATH}/sunxi_a7_19.07/staging_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi"
export TOOLCHAIN_DIR="${TOOLCHAINS_PATH}/sunxi_a7_19.07/openwrt-toolchain-sunxi-cortexa7_gcc-7.4.0_musl_eabi.Linux-x86_64/toolchain-arm_cortex-a7+neon-vfpv4_gcc-7.4.0_musl_eabi"
export PATH="$TOOLCHAIN_DIR/bin:$PATH"

export TOOLCHAIN_ARCH=arm

export CC=$TOOLCHAIN_ARCH"-openwrt-linux-gcc"
export CXX=$TOOLCHAIN_ARCH"-openwrt-linux-g++"
export AR=$TOOLCHAIN_ARCH"-openwrt-linux-ar"
export STRIP=$TOOLCHAIN_ARCH"-openwrt-linux-strip"
