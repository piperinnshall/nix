{
  pkgs,
  ...
}:
{
  home.packages = with pkgs;
    [
      oh-my-fish
    ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
set -U fish_key_bindings fish_vi_key_bindings
    '';

    functions = {
      fdir = {
        body = ''
set dir (fzf --preview="ls -la --color=always {}" --walker=dir)
if test -n "$dir"
  cd "$dir"
end
        '';
      };
    };

    shellAliases = {
      cat = "${pkgs.bat}/bin/bat";
      vi = "nvim";
      fzf = ''fzf --preview 'bat --style=numbers --color=always {}' '';
    };
  };

  xdg.configFile."omf/theme".text = ''
bobthefish
  '';
}
