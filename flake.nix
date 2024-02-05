{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { nixvim, flake-parts, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      perSystem = { pkgs, system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = import ./config;
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              test = false;
            };
          };
          rust = nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = {
              imports = [
                ./config
                ./config/plugins/lsp/rust.nix
              ];
            };
            extraSpecialArgs = {
              test = true;
            };
          };
        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNvim {
              inherit nvim;
              name = "A nixvim configuration";
            };
          };

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
            rust = rust;
          };
        };
    };
}
