{ callPackage }: rec {
  rust-analyzer-unwrapped = callPackage ./generic.nix rec {
    rev = "2020-12-28";
    version = "unstable-${rev}";
    sha256 = "sha256-GTCAhazGlcP8gip/4pDWB9bH3vfKDbFu+CAzqR36poE=";
    cargoSha256 = "sha256-flw/uV7pXwK1NoZfo4cN0sOiEPTM0klKxfSLyPrQgtA=";
  };

  rust-analyzer =
    callPackage ./wrapper.nix { } { unwrapped = rust-analyzer-unwrapped; };
}
