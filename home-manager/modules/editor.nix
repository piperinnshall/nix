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
    enable       = true;
    viAlias      = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      lua-language-server
      rust-analyzer
      nil
    ];
  };

  xdg.configFile."nvim".source = nvimDotfiles;
}
