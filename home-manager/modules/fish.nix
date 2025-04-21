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
      vim = "nvim";
      vi = "vim";
      fzf = ''fzf --preview 'bat --style=numbers --color=always {}' '';
    };
  };

  xdg.configFile."omf/theme".text = ''
bobthefish
  '';
}
