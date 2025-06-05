{
  config,
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
  };

  xdg.configFile."nvim".source = nvimDotfiles;
}

