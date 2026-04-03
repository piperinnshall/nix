{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    raycast
    vlc-bin
    zathura
    discord
    ninja
  ];
}
