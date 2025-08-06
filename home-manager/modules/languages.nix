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
