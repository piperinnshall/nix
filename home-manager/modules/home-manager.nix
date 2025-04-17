{
  pkgs,
  ...
}:
{
  home.stateVersion = "24.11";

  home.packages = with pkgs; [ home-manager ];

  programs.home-manager = {
    enable = true;
  };
}
