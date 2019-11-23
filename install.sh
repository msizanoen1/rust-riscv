#!/bin/bash
root="$(rustc --print sysroot)"
deps=target/riscv64gc-unknown-linux-gnu/release/deps
lib="$root/lib/rustlib/riscv64gc-unknown-linux-gnu/lib"
rm -rf "$lib"
mkdir -p "$lib"
cp $deps/* "$lib"
rm $lib/*.d $lib/*.rmeta
