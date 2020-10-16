TOOLCHAINS_PATH="/toolchains"

export STAGING_DIR="${TOOLCHAINS_PATH}/x86_64_glibc_19.07/staging_dir/target-x86_64_glibc"
export TOOLCHAIN_DIR="${TOOLCHAINS_PATH}/x86_64_glibc_19.07/openwrt-toolchain-x86-64_gcc-7.5.0_glibc.Linux-x86_64/toolchain-x86_64_gcc-7.5.0_glibc"
export PATH="$TOOLCHAIN_DIR/bin:$PATH"

export TOOLCHAIN_ARCH=x86_64

export CC=$TOOLCHAIN_ARCH"-openwrt-linux-gcc"
export CXX=$TOOLCHAIN_ARCH"-openwrt-linux-g++"
export AR=$TOOLCHAIN_ARCH"-openwrt-linux-ar"
export STRIP=$TOOLCHAIN_ARCH"-openwrt-linux-strip"
