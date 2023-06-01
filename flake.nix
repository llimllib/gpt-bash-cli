{
  description = "A very basic flake for gpt-cli";
  nixConfig.bash-prompt = "[gpt-cli-development-env]$ ";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs }: let
    # The set of systems to provide outputs for
    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    # A function that provides a system-specific Nixpkgs for the desired systems
    forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f { pkgs = import nixpkgs { inherit system; }; });
  in {
    packages = forAllSystems ({ pkgs }: {
      default = pkgs.mkShell {
        buildInputs = [ pkgs.jq pkgs.sqlite ];
      };
    });
  };
}
