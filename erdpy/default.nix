{ pkgs ? import <nixpkgs> { } }:
let
  pythonPkgs = pkgs.callPackage (import ./python-packages.nix) { };
  # overlayed = pkgs.lib.fix (pkgs.lib.extends pythonPkgs pkgs.python3Packages.__unfix__);
  # overlayed = pkgs.lib.fix
in
# pkgs.callPackage (import ./erdpy.nix) { python3Packages = overlayed; }
pkgs.callPackage (import ./erdpy.nix) { }
