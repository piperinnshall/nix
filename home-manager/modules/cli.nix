{
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    fastfetch.enable = true;
    eza.enable = true;
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
        core.editor = "vim";
        init = {
          defaultBranch = "main";
        };
      };
      ignores = [
        "tags"
        ".DS_Store"
      ];
      signing.key = "65C0F3D84E581744";
      signing.format = "openpgp";
    };
    tmux = {
      enable = true;
      terminal = "alacritty";
      keyMode = "vi";
      baseIndex = 1;
      escapeTime = 0;
      plugins = [
        pkgs.tmuxPlugins.resurrect
      ];
      extraConfig = ''
        set -ga terminal-overrides ',alacritty:Tc'
        set -as terminal-overrides ',alacritty:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

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
        setw -g window-status-current-format '#W '
        setw -g window-status-format '#W '
        setw -g window-status-style 'fg=colour8'

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind -r H swap-pane -U
        bind -r J swap-pane -D
        bind -r K swap-pane -U
        bind -r L swap-pane -D

        bind c new-window -c ~
      '';
    };
  };
}
