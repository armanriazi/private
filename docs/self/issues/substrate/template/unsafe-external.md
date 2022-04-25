---
tags:
  - ws
  - rpc
  - build
  - external
  - unsafe
---


**Error: Input(" --ws-external options shouldn't be used if the node is running as a validator. Use `--unsafe-rpc-external` or `--rpc-methods=unsafe` if you understand the risks. See the options description for more information.")**
??? info
    Remove this line
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' 
    Add:
    --unsafe-rpc-external \
    --rpc-methods=unsafe \  
    --ws-external \

[[issue-substrate]]
