#!/bin/bash

export ARCH=arm64
mkdir out

BUILD_CROSS_COMPILE=/home/bupbipbuild/work/toolchain/UBERTC-aarch64-linux-android-4.9-78e5a7be6044/bin/aarch64-linux-android-
KERNEL_LLVM_BIN=/home/bupbipbuild/work/toolchain/Snapdragon-LLVM-10.0.9/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE vendor/gts7l_eur_open_defconfig
make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE
 
cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
