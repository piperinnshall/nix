{
  pkgs,
  config,
  ...
}:
let
  nvimDotfiles = config.lib.file.mkOutOfStoreSymlink
  "/etc/nix-darwin/home-manager/configs/nvim";
in
{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs;
      [
        tree-sitter-grammars.tree-sitter-html
        tree-sitter-grammars.tree-sitter-latex
        tree-sitter-grammars.tree-sitter-java
        tree-sitter-grammars.tree-sitter-python
      ];
  };

  xdg.configFile."nvim".source = nvimDotfiles;
}
