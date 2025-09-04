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
    pandoc.enable       = true;
    texlive = {
      enable            = true;
      extraPackages     = tpkgs: {
        inherit (tpkgs)
          collection-basic
          collection-latex
          collection-latexrecommended;
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
        core.editor     = "nvim";
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
    tmux = {
      enable = true;
      keyMode = "vi";
      baseIndex = 1;
      escapeTime = 0;
      extraConfig = ''
        set -g renumber-windows on

        set -g terminal-overrides ",xterm*:sitm=\e[3m:ritm=\e[23m"
        set -sa terminal-features ',xterm-256color:RGB'
        set -a terminal-features 'screen-256color:RGB'
        set -g allow-passthrough on

        bind r source-file ~/.config/tmux/tmux.conf

        set -g status-position top
        set -g status-justify centre
        set -g status-style 'fg=colour7 bg=default'

        set -g status-left '#S'
        set -g status-left-style 'fg=colour8'
        set -g status-left-length 100
        set -g status-right ""
        set -g status-right-length 0

        setw -g window-status-current-style 'fg=colour6 bg=default bold'
        setw -g window-status-current-format '#I:#W '
        setw -g window-status-style 'fg=colour8'

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind -r H swap-pane -U
        bind -r J swap-pane -D
        bind -r K swap-pane -U
        bind -r L swap-pane -D

        bind ^ last-window
      '';
    };
  };
}

