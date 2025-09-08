{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    rustup
    nodejs_22
    typst
    typstyle
    cmake
    python313Packages.pip
  ];

  programs = {
    java = {
      enable = true;
      package = pkgs.jdk24;
    };
    gradle = {
      enable = true;
      package = pkgs.gradle_8;
    };
  };
}
