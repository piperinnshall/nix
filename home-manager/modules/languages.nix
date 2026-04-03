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
    google-java-format
    nixfmt-rfc-style
    universal-ctags
  ];

  programs = {
    java = {
      enable = true;
      package = pkgs.jdk25;
    };
    gradle = {
      enable = true;
      package = pkgs.gradle_8;
    };
  };
}
