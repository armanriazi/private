---
tags:
  - E0425
  - pallet
  - cargo
  - toml
  - runtime
  - build
---


**cannot find function `memory_teardown` in module `sandbox`**
??? info
    > If you forget to update the features section, you might see errors similar to the following when you build the native binaries.
    > Make sure added your pallet to toml and runtime rust file and implemet pallets to runtime rust file or construct_decl if there is subtype
    cargo check -p node-template-runtime

[[issue-substrate]]

