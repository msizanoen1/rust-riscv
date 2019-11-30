# rust-riscv
A set of script and patches to build the Rust standard library for RISC-V on GNU/Linux.
This should no longer be necessary when RISC-V support for GNU/Linux is upstreamed.

# Dependencies
- RISC-V GCC cross toolchain
- Rust nightly compiler
- Rust `rust-src` component: `rustup component add rust-src`

# Building
```bash
./setup.sh   # Copy and patch sources
./build.sh   # Build standard library
./install.sh # Install the built libraries into rustc sysroot
./clean.sh   # Optional, clean everything
```

# Usage
To compile a program, pass `--target riscv64gc-unknown-linux-gnu` to Cargo.
Also make sure `rustc` use the RISC-V cross toolchain by setting the `RUSTFLAGS` environment variable to `-C linker=riscv64-unknown-linux-gnu`.
If the program depends on C code, set the `CC_riscv64gc_unknown_linux_gnu` to the cross compiler and set `CFLAGS_riscv64gc_unknown_linux_gnu` to `-mabi=lp64d -fPIC`.
If the build process report failure to build `libc` crate, make sure you use the latest version by running `cargo update -p libc`.
