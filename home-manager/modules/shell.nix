let
text = "240;240;240";
colors = [
  "255;118;1"
  "243;162;109"
  "173;238;217"
  "86;223;207"
  "10;186;181"
];

esc = mode: color: "\\[\\e[${mode};2;${color}m\\]";
colorPairs = map (color: {
  fg = esc "38" color;
  bg = esc "48" color;
}) colors;

R = "\\[\\e[0m\\]";
txt = esc "38" text;
c1 = builtins.elemAt colorPairs 0;
c2 = builtins.elemAt colorPairs 1;
c3 = builtins.elemAt colorPairs 2;
c4 = builtins.elemAt colorPairs 3;
c5 = builtins.elemAt colorPairs 4;
in
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
    };
    initExtra = ''
      PS1="\
      ${c1.fg} ${c1.bg}${txt} piper ${R}\
      ${c2.bg}${c1.fg}${R}\
      ${c3.bg}${c2.fg}${R}\
      ${c4.bg}${c3.fg}${R}\
      ${c5.bg}${c4.fg}${R}\
      ${c5.bg}${txt} \\W ${R}\
      ${c5.fg}${R}\
      \n ❯ "
      # export PS1
      set -o vi
      export EDITOR="nvim"
    '';
  };
  programs.readline = {
    enable = true;
    extraConfig  = ''
      set editing-mode vi
      set show-mode-in-prompt on
      set vi-cmd-mode-string "\1\e[2 q\2"
      set vi-ins-mode-string "\1\e[6 q\2"
    '';
  };
}

