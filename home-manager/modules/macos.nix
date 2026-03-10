{
  pkgs,
    ...
}:
{
  home.packages = with pkgs; [
    raycast
    mas
    vlc-bin
    zathura
    discord
    ninja
 ];
}

