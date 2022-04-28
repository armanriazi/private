### Node-Setup1
```
./target/release/node-template \
  --base-path /tmp/alice \
  --chain local \
  --alice \
  --port 30333 \
  --ws-port 9945 \
  --rpc-port 9933 \
  --unsafe-rpc-external \
  --rpc-methods=unsafe \
  --validator \
  --ws-external \
  --rpc-cors all  \
  --no-mdns \
  --name "Arman Riazi"  \
  --node-key 0000000000000000000000000000000000000000000000000000000000000001 
```

### Node-Setup2
```
./target/release/node-template \
  --base-path /tmp/bob \
  --chain local \
  --bob \
  --port 30334 \
  --ws-port 9946 \
  --unsafe-rpc-external \
  --rpc-methods=unsafe \
  --rpc-port 9934 \
  --validator \
  --ws-external \
  --rpc-cors all  \
  --no-mdns  \
  --name "Arman Riazi 2"  \
  --bootnodes /ip4/192.168.8.110/tcp/30333/p2p/12D3KooWEyoppNCUx8Yx66oV9fJnriXwCcXwDDUA2kj6vnc6iDEp
```

### Node-Setup-Other-Commands  
  --enable-offchain-indexing true \
  --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
  --enable-offchain-indexing true \
  --chain ./customSpecRaw.json \  
  --rpc-methods Unsafe \

```
subkey restore Alice
```
```
./target/release/node-template purge-chain --base-path /tmp/alice --chain local
```

/home/u2004zero/u2004zero/app/substrate/substrate-node-template
cargo build --release && ./target/release/node-template --ws-external --rpc-cors all --name "Arman Riazi" --pruning archive --prometheus-external --chain local  --tmp
 --dev  (fir)  (--base-path ./my-chain-state --enable-offchain-indexing true)

/scripts/docker_run.sh cargo build --release && ./target/release/node-template --dev --ws-external --base-path ./my-chain-state

SKIP_WASM_BUILD=1 cargo check -p node-template-runtime
