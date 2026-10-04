{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    audacity
    zmk-studio
    webtorrent_desktop
    prismlauncher
  ];
  # programs = {
  #   discord.enable = true;
  # };
}
