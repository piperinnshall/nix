{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      fzf = ''fzf --preview 'cat {}' '';
      ls = "ls --color=auto";
      la = "ls -lah --color=auto";
      tree = "eza  --color=auto --tree";
    };
    initExtra = ''
      export PS1=" ❯ "
      set -o vi
      export EDITOR="vim"
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
