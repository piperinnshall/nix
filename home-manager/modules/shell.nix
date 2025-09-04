{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      cat  = "bat -p";
      fzf  = ''fzf --preview 'bat --style=numbers --color=always {}' '';
      ls   = "eza";
      tree = "eza --icons always --tree";
      la   = "eza --all --show-symlinks --icons always -l";
      vi   = "nvim";
    };
    initExtra = ''
      export PS1=" ❯ "
      set -o vi
      export EDITOR="nvim"
    '';
  };
  programs.readline = {
    enable = true;
    extraConfig  = ''
      set editing-mode vi
      set show-mode-in-prompt on
      set keyseq-timeout 10
    '';
  };
}

