{
  pkgs,
  ...
}:
{
  home.packages = with pkgs;
    [
      nodejs_23
      python312Packages.conda
      rustup
    ];

  programs = {
    java = {
      enable = true;
      package = pkgs.jdk23;
    };
    gradle = {
      enable = true;
      package = pkgs.gradle_8;
    };
  };
}
