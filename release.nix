let
  pkgs = import <nixpkgs> { };

in
  { gostan = pkgs.haskellPackages.callPackage ./default.nix { };
  }
