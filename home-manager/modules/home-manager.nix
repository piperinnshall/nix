{
  pkgs,
  ...
}:
{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    home-manager
  ];

  programs.home-manager = {
    enable = true;
  };
}
