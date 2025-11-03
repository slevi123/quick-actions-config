{
  outputs = toplevel@{ self, flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inputs = toplevel; } (
      { ... }: {
        systems = [
          "x86_64-linux"
        ];

        perSystem = { pkgs, ... }:
        {
          packages.default = pkgs.runCommand "quick-actions-config" {} ''
            cp -r ${self} $out
          '';
        };
      }
  );
  
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
}