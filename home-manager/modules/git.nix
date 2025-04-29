{
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "piperinnshall";
    userEmail = "piper.innshall@gmail.com";
    signing.key    = "65C0F3D84E581744";
    signing.format = "openpgp";
    extraConfig = {
      commit.gpgSign  = true;
      tag.gpgSign     = true;
      core.editor     = "vim";
    };
  };
}
