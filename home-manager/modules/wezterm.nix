{
  config,
  ...
}:
let
weztermDotFiles = config.lib.file.mkOutOfStoreSymlink
"/etc/nix-darwin/home-manager/configs/wezterm";
in
{
  programs.wezterm = {
    enable = true;
  };

  xdg.configFile."wezterm".source = weztermDotFiles;
}
