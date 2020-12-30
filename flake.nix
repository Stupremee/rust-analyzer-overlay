{
  description = "Overlay for the latest Rust Analyzer release";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # We don't use this in here, but we use it inside the `default.nix`
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    {
      overlay = final: prev:
        let
          pkgs = nixpkgs.legacyPackages.${prev.system};
          overlay = pkgs.callPackage ./rust-analyzer { };
        in { inherit (overlay) rust-analyzer rust-analyzer-unwrapped; };
    } // flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          overlays = [ self.overlay ];
          inherit system;
        };
      in { defaultPackage = pkgs.rust-analyzer; });
}
