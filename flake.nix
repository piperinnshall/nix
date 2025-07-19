{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    zen-browser = {
      url = "github:conneroisu/zen-browser-flake";
    };
  };

  outputs = inputs@{
    self,
    nix-darwin,
    nixpkgs,
    nix-homebrew,
    homebrew-bundle,
    homebrew-core,
    homebrew-cask,
    home-manager,
    zen-browser,
  }:
  {
    darwinConfigurations."Pipers-MacBook-Pro" =
      nix-darwin.lib.darwinSystem {
        modules =
          [
            ./hosts/aarch64-darwin/fonts.nix
            ./hosts/aarch64-darwin/configuration.nix
            nix-homebrew.darwinModules.nix-homebrew
            home-manager.darwinModules.home-manager
            {
              nix-homebrew.enable                   = true;
              nix-homebrew.enableRosetta            = true;
              nix-homebrew.user                     = "piperinnshall";
              nix-homebrew.mutableTaps              = false;
              nix-homebrew.taps = {
                "homebrew/homebrew-core"            = homebrew-core;
                "homebrew/homebrew-cask"            = homebrew-cask;
              };
              homebrew.enable                       = true;
              homebrew.brews = [
                "jdtls"
              ];
              homebrew.casks = [
                "roblox"
                "godot"
                "steam"
                "miniconda"
                "wine-stable"
              ];
              homebrew.masApps = {
                "IWallPaper"                        = 1552826194;
              };
              users.users.piperinnshall.home        = "/Users/piperinnshall";
              home-manager.useGlobalPkgs            = true;
              home-manager.useUserPackages          = true;
              home-manager.users.piperinnshall = {
                imports =
                  [
                    # General
                    ./home-manager/modules/home-manager.nix
                    ./home-manager/modules/window.nix

                    # Development Environment
                    ./home-manager/modules/editor.nix
                    ./home-manager/modules/terminal.nix
                    ./home-manager/modules/languages.nix

                    # Command-Line Interface
                    ./home-manager/modules/shell.nix
                    ./home-manager/modules/cli.nix

                    # Applications
                    ./home-manager/modules/browser.nix
                    ./home-manager/modules/macos.nix
                  ];
              };
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
            }
          ];
      };
  };
}
