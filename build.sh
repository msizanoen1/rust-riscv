#!/bin/bash
rm -rf target/riscv64gc-unknown-linux-gnu
export RUSTFLAGS="--remap-path-prefix=$PWD=/rustc --remap-path-prefix=$HOME/.cargo=/cargo -C linker=riscv64-unknown-linux-gnu-gcc"
export CC_riscv64gc_unknown_linux_gnu=riscv64-unknown-linux-gnu-gcc
export CFLAGS_riscv64gc_unknown_linux_gnu="-mabi=lp64d -fPIC"
cargo build \
    --release \
    --target spec/riscv64gc-unknown-linux-gnu.json \
    --manifest-path src/libtest/Cargo.toml \
    --features backtrace,panic-unwind
