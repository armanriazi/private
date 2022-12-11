### Cargo

#### Help

```
cargo --list
```

#### Build Run

```
cargo build --features foo
```

```
cargo build --release --target=wasm32-unknown-unknown
```

```
cargo run -p subcrate
```

```
time cargo run
```

```
cargo make --makefile build.toml
```

#### Tree

```
cargo tree -d
```

```
cargo tree --duplicates
```

[!info] This will show features in the dependency graph. Each feature will appear showing which package enabled it

```
cargo tree -e features
```

```
cargo modules generate tree --with-types --package shared
```

[!info] This is a more compact view that shows a comma-separated list of features enabled on each package

```
cargo tree -f "{p} {f}"
```

[!info] This will invert the tree, showing how features flow into the given package "foo". This can be useful because viewing the entire graph can be quite large and overwhelming. Use this when you are trying to figure out which features are enabled on a specific package and why. See the example at the bottom of the cargo tree page on how to read this.

```
cargo tree -e features -i foo
```

#### Watch

```
cargo watch -x run
```

#### Package

```
cargo clear
```

```
cargo upgrade/add package
```

```
cargo publish -vvv --no-verify
```

```
cargo release
```

#### Fix

```
cargo fix --allow-dirty --edition
```

```
cargo clippy --fix
```

```
cargo clippy -p example -- --no-deps
```

#### Test

> Test coverage on linux

```
cargo tarpaulin --out Html
```

```
cargo test -- --ignored
```

```
cargo audit
```

```
cargo nexttest run
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