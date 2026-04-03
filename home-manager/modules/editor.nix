{
  inputs,
  config,
  pkgs,
  ...
}:
let
  vimDotfiles = config.lib.file.mkOutOfStoreSymlink "/etc/nix-darwin/home-manager/configs/vim";
in
{
  home.packages = [ pkgs.vim ];
  home.file.".vim".source = vimDotfiles;
}
