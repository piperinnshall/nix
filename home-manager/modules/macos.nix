{
  pkgs,
    ...
}:
{
  home.packages = with pkgs; [
    raycast
    mas
    prismlauncher
    vlc-bin
    zathura
    discord
    ninja
  ];
}

