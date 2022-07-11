### Cargo

```
cargo build --release --target=wasm32-unknown-unknown
```

```
cargo tree -d
```

```
time cargo run
```

```
cargo watch -x run
```

```
cargo clear
```

```
cargo fix --allow-dirty
```

```
cargo fix --edition
```

```
cargo clippy --fix
```

```
cargo clippy -p example -- --no-deps
```

```
cargo test -- --ignored
```

```
cargo tarpaulin --out Html
```

```
cargo publish -vvv --no-verify
```

### Rust

```
RUST_LOG=debug RUST_BACKTRACE=1 ./target/release/node-template -lruntime=debug --dev
```

```
rustup show
```

```
rustup default stable
```

```
rustup update nightly
```

```
rustup update stable
```

```
rustup toolchain install nightly version
```

```
rustup target add wasm32-unknown-unknown --toolchain stable
```

```
rustup component add rust-src --toolchain stable-x86_64-unknown-linux-gnu
```

> rust-toolchain.toml file content:

```
[toolchain]
channel = "stable-x86_64-unknown-linux-gnu"
components = [ "rustfmt", "rustc-dev","clippy"]
targets = [ "x86_64-unknown-linux-gnu", "wasm32-unknown-unknown" ]
profile = "minimal"
```

```
rustup override set stable
```

### In/Unistall

#### Rust And Cargo

> Providing configuration for rust and substarte on ubuntu

```
apt-get update

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe"

apt-get -u dist-upgrade

apt install aptitude

sudo aptitude install libc6=2.31-0ubuntu9

sudo aptitude install build-essential

apt-get update

sudo apt install -y cmake pkg-config libssl-dev git gcc build-essential clang libclang-dev

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y

rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy
curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable

source $HOME/.cargo/env

[Continue reference to](#Rust)

cargo install --git https://github.com/alexcrichton/wasm-gc --force

#rustup component add --toolchain=nightly rust-src rustfmt

apt-get install llvm clang linux-headers-"$(uname -r)"

apt install llvm clang

cargo build --release

```
[Other commands(Maybe you needs follow): Cargo command section](#Cargo)


#### Uninstall Cargo And Rust

```
rustup self uninstall
```

### WASM

```
cargo build --target wasm32-unknown-unknown --release
```

```
curl https://get.wasmer.io -sSfL | sh
```

```
wasm-gc ./target/wasm32-unknown-unknown/release/wasm_example.wasm ./wasm_example_rust.wasm
```

```
wasm-pack build --target web
```

```
wasmer wasm_example_rust.wasm -i yourprogram args
```

#### Optional

```
sudo apt-get install libtinfo5
```

```
sudo apt-get install  libncurses5
```


```
console.log("🦀 Rust + 🕸 Wasm = ❤");
```

```
python3 -m http.server
```