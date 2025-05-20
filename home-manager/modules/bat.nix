{
  ...
}:
let
  tokyonight = builtins.fetchGit {
    url = "https://github.com/folke/tokyonight.nvim.git";
    ref = "main";
    rev = "057ef5d260c1931f1dffd0f052c685dcd14100a3";
  };
in
{
  programs.bat = {
    enable = true;

    config = {
      theme = "tokyonight_day";
    };

    themes = {
      tokyonight_day = {
        src = "${tokyonight}/extras/sublime/tokyonight_day.tmTheme";
      };
    };
  };
}

