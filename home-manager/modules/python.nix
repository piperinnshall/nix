{
  pkgs,
  ...
}:
{
  home.packages = with pkgs;
    [
      python312Packages.conda
    ];
}
