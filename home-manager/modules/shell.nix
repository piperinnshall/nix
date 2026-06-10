{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      dev = "cd ~/Developer";
      doc = "cd ~/Documents";
      nix = "cd /etc/nix-darwin";
      fzf = ''fzf --preview 'cat {}' '';
      ls = "ls --color=auto";
      la = "ls -lah --color=auto";
      ll = "ls -l --color=auto";
      tree = "eza  --color=auto --tree";
      fearless = "~/Developer/Java/Fearless/StandardLibrary/fearlessArtefact/fearless.app/Contents/MacOS/fearless";
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
