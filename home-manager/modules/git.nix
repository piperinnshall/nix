{
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "piperinnshall";
    userEmail = "piper.innshall@gmail.com";
    signing.key    = "392402C5E2AED497";
    signing.format = "openpgp";
    extraConfig = {
      commit.gpgSign  = true;
      tag.gpgSign     = true;
      core.editor     = "vim";
    };
  };
}
