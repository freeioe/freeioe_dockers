TOOLCHAINS_PATH="/toolchains"

export STAGING_DIR="${TOOLCHAINS_PATH}/ramips_mt76x8/staging_dir/target-mipsel_24kc_musl"
export TOOLCHAIN_DIR="${TOOLCHAINS_PATH}/ramips_mt76x8/openwrt-toolchain-ramips-mt76x8_gcc-8.4.0_musl.Linux-x86_64/toolchain-mipsel_24kc_gcc-8.4.0_musl"
export PATH="$TOOLCHAIN_DIR/bin:$PATH"

export TOOLCHAIN_ARCH=mipsel

export CC=$TOOLCHAIN_ARCH"-openwrt-linux-gcc"
export CXX=$TOOLCHAIN_ARCH"-openwrt-linux-g++"
export AR=$TOOLCHAIN_ARCH"-openwrt-linux-ar"
export STRIP=$TOOLCHAIN_ARCH"-openwrt-linux-strip"
