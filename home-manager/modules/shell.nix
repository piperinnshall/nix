let
  aliases = {
      cat = "bat -p";
      fzf = ''fzf --preview 'bat --style=numbers --color=always {}' '';
      fetch = "hyfetch";
      ls = "eza";
      la = "eza --all --show-symlinks --icons always -l";
      tree = "eza --all --show-symlinks --icons always --tree";
  };
in
{
  programs.fish = {
    enable = true;
    shellAliases = aliases;
    interactiveShellInit = ''
set -U fish_key_bindings fish_vi_key_bindings
    '';
  };
  programs.bash = {
    enable = true;
    shellAliases = aliases;
    enableCompletion = true;
    initExtra = ''
set -o vi
export PS1='\u@\h \w> '
export EDITOR="nvim"
    '';
  };
}
