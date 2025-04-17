{
  pkgs,
  ...
}:
{
  home.packages = with pkgs;
  [
    firefox-unwrapped
  ];
}
