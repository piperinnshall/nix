{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    zmk-studio
    webtorrent_desktop
    prismlauncher
  ];
  # programs = {
  #   discord.enable = true;
  # };
}
