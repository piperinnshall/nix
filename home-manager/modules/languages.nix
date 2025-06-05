{
  pkgs,
  ...
}:
{
  home.packages = with pkgs;
    [
      jdk23
      gradle_8
      nodejs_23
      python312Packages.conda
      rustup
    ];
}
