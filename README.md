# Rust Analyzer Overlay

Nix overlay for the latest [Rust Analyzer] version.

# How to use this overlay

## Install global on your system

Create `~/.config/nixpkgs/overlays` directory and create a file named `rust-analyzer.nix`
inside this directory and place the following inside:

```nix
import (builtins.fetchTarball {
  url = https://github.com/Stupremee/rust-analyzer-overlay/archive/main.tar.gz;
})
```

## Using Nix flakes

```nix
{
  # ...
  inputs.rust-analyzer-overlay.url = "github:Stupremee/rust-analyzer-overlay";

  outputs = { self, nixpkgs, rust-analyzer-overlay }:
    let
      pkgs = import <nixpkgs> {
        overlays = [ self.overlay ];
      };
    in {
      overlay = final: prev: {
        rust-analyzer = rust-analyzer-overlay.overlay;
      };
    };
}
```

[Rust Analyzer]: https://github.com/rust-analyzer/rust-analyzer
