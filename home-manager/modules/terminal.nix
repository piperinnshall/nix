{
  pkgs,
  ...
}:
let
  tokyonight = builtins.fetchGit {
    url = "https://github.com/folke/tokyonight.nvim.git";
    rev = "057ef5d260c1931f1dffd0f052c685dcd14100a3";
  };
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal = {
        shell = {
          program = "${pkgs.fish}/bin/fish";
          args = [ "-l" ];
        };
      };
      window = {
        decorations = "none";
        opacity = 0.5;
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 13.0;
      };
      general.import = [ "${tokyonight}/extras/alacritty/tokyonight_day.toml" ];
    };
  };
}
