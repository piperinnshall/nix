{
  pkgs,
  ...
}:
let
melange = builtins.fetchGit {
  url = "https://github.com/savq/melange-nvim.git";
  rev = "ce42f6b629beeaa00591ba73a77d3eeac4cf28ce";
};
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal = {
        shell = {
          program = "${pkgs.bash}/bin/bash";
        };
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
      general.import = [ "${melange}/term/alacritty/melange_light.toml" ];
    };
  };
}
