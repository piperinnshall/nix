{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
set -U fish_key_bindings fish_vi_key_bindings
    '';

    functions = {
      fdir = {
        body = ''
set dir (fzf --preview="eza -all --show-symlinks --icons always {}" --walker=dir)
if test -n "$dir"
  cd "$dir"
end
        '';
      };
    };

    shellAliases = {
      cat = "bat -p";
      fzf = ''fzf --preview 'bat --style=numbers --color=always {}' '';
      fetch = "hyfetch";
      ls = "eza";
      la = "eza --all --show-symlinks --icons always -l";
      tree = "eza --all --show-symlinks --icons always --tree";
    };
  };
}
