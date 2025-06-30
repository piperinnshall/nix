let
  tokyonight = builtins.fetchGit {
    url = "https://github.com/folke/tokyonight.nvim.git";
    rev = "057ef5d260c1931f1dffd0f052c685dcd14100a3";
  };
in
{
  programs = {
    eza.enable          = true;
    fastfetch.enable    = true;
    fd.enable           = true;
    fzf.enable          = true;
    gpg.enable          = true;
    ripgrep.enable      = true;
    hyfetch = {
      enable            = true;
      settings = {
        preset          = "transgender";
        mode            = "rgb";
        light_dark      = "light";
        lightness       = 1.0;
        color_align = {
          mode          = "vertical";
          custom_colors = [];
        };
        backend         = "fastfetch";
      };
    };
    git = {
      enable            = true;
      userName          = "piperinnshall";
      userEmail         = "piper.innshall@gmail.com";
      signing.key       = "65C0F3D84E581744";
      signing.format    = "openpgp";
      extraConfig = {
        commit.gpgSign  = true;
        tag.gpgSign     = true;
        core.editor     = "vim";
        init = {
          defaultBranch = "main";
        };
      };
    };
    bat = {
      enable            = true;
      config.theme      = "tokyo";
      themes.tokyo.src  = "${tokyonight}/extras/sublime/tokyonight_day.tmTheme";
    };
  };
}

