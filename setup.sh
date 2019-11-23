#!/bin/bash
root="$(rustc --print sysroot)"
src="$root/lib/rustlib/src/rust"
cp -r $src/* .
cargo update -p libc
patch -p1 < patches/rust-std.patch
