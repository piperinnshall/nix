{
  pkgs,
  ...
}:
{

  home.packages = with pkgs;
    [
      gradle_8
    ];
}
