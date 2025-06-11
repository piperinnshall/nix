{
  config,
  pkgs,
  ...
}:
let
  nvimDotfiles = config.lib.file.mkOutOfStoreSymlink
    "/etc/nix-darwin/home-manager/configs/nvim";
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs;
      [
        llvmPackages_20.clang-unwrapped
        lua-language-server
        nil
        rust-analyzer
      ];
  };

  xdg.configFile."nvim".source = nvimDotfiles;
}

