{
  pkgs,
  ...
}:
{

  home.packages = with pkgs;
    [
      jdk23
      gradle_8
    ];
}
