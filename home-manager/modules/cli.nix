{
  programs = {
    eza.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    fzf.enable = true;
    gpg.enable = true;
    ripgrep.enable = true;
    git = {
      enable = true;
      settings = {
        user.name = "Piper Inns Hall";
        user.email = "piper.innshall@gmail.com";
        commit.gpgSign = true;
        tag.gpgSign = true;
        core.editor = "nvim";
        init = {
          defaultBranch = "main";
        };
      };
      signing.key = "65C0F3D84E581744";
      signing.format = "openpgp";
    };
    bat = {
      enable = true;
      config.theme = "OneHalfLight";
    };
    tmux = {
      enable = true;
      terminal = "tmux-256color";
      keyMode = "vi";
      baseIndex = 1;
      escapeTime = 0;
      extraConfig = ''
        set -ga terminal-overrides ',xterm-256color:Tc'

        set -g renumber-windows on
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
