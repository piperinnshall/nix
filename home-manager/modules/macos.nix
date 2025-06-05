{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    raycast
    mas
  ];
}

