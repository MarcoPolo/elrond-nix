{

  description = "Internet speed and latency reporter using fast.com and 1.1.1.1";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/staging-next";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.flake-utils.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ (import ./erdpy/python-packages.nix) ];
          };
          erdpy = import ./erdpy/default.nix { inherit pkgs; };
        in
        {
          nixpkgs.overlays = [ ];
          defaultPackage = erdpy;
          devShell = pkgs.mkShell {
            buildInputs = [ erdpy ];
          };
        }
      );

}
