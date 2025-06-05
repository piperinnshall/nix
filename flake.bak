{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  }:
  let
    inherit (nixpkgs.lib) attrValues;
  in
  {
    darwinConfigurations."Pipers-MacBook-Pro" =
      nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit self; };
        modules =
          attrValues (rec {
            defaults      = import ./hosts/darwin-m1/defaults.nix;
            fonts         = import ./hosts/darwin-m1/fonts.nix;
          })
          ++ [
            ./hosts/darwin-m1/configuration.nix
            home-manager.darwinModules.home-manager
            {
              users.users.piperinnshall.home        = "/Users/piperinnshall";
              home-manager.useGlobalPkgs            = true;
              home-manager.useUserPackages          = true;
              home-manager.users.piperinnshall = {
                imports =
                  [
                    # General
                    ./home-manager/modules/home-manager.nix
                    ./home-manager/modules/firefox.nix
                    ./home-manager/modules/aerospace.nix

                    # Development
                    ./home-manager/modules/neovim.nix
                    ./home-manager/modules/editorconfig.nix
                    ./home-manager/modules/wezterm.nix
                    ./home-manager/modules/godot.nix

                    # Programming Languages
                    ./home-manager/modules/java.nix
                    ./home-manager/modules/javascript.nix
                    ./home-manager/modules/python.nix
                    ./home-manager/modules/rust.nix

                    # Command Line Interface
                    ./home-manager/modules/fish.nix
                    ./home-manager/modules/bat.nix
                    ./home-manager/modules/fzf.nix
                    ./home-manager/modules/git.nix
                    ./home-manager/modules/gpg.nix
                    ./home-manager/modules/hyfetch.nix
                    ./home-manager/modules/fastfetch.nix
                    ./home-manager/modules/eza.nix
                    ./home-manager/modules/ripgrep.nix
                    ./home-manager/modules/epy.nix

                    # MacOS
                    ./home-manager/modules/raycast.nix
                    ./home-manager/modules/mas.nix
                  ];
              };
            }
          ];
      };
  };
}
