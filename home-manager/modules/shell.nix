{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      cat = "bat -p";
      fzf = ''fzf --preview 'bat --style=numbers --color=always {}' '';
      ls = "eza --color=always --group --links";
      la = "eza --all --color=always --group --show-symlinks --icons always -l --links";
      tree = "eza  --color=always --show-symlinks --icons always --tree";
      vi = "nvim";
    };
    initExtra = ''
      export PS1=" ❯ "
      set -o vi
      export EDITOR="nvim"
    '';
  };
  programs.readline = {
    enable = true;
    extraConfig = ''
      set editing-mode vi
      set show-mode-in-prompt on
      set keyseq-timeout 10
    '';
  };
}
