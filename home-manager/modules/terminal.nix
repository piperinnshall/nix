{
  pkgs,
  ...
}:
{
  programs.alacritty = {
    enable = true;
    theme = "everforest_light";
    settings = {
      terminal = {
        shell = {
          program = "${pkgs.bash}/bin/bash";
        };
      };
      env = {
        TERM = "alacritty";
      };
      window = {
        decorations = "none";
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 13.0;
      };
      colors = {
        primary = {
          background = "#fffbef";
        };
      };
    };
  };
}
