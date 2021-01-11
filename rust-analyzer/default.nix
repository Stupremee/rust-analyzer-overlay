{ callPackage }: rec {
  rust-analyzer-unwrapped = callPackage ./generic.nix rec {
    rev = "2021-01-11";
    version = "unstable-${rev}";
    sha256 = "sha256-oBhE+nZEdYJpCmAYBOv1z1FKv0+/BZrhTvW6TyRNs8g=";
    cargoSha256 = "sha256-8PyCOMX9jUNAy73HMs9QhDANLDkUUD/nBMrNMaIrMX0=";
  };

  rust-analyzer =
    callPackage ./wrapper.nix { } { unwrapped = rust-analyzer-unwrapped; };
}
