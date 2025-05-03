{
  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.LoginwindowText = "Nix Darwin";
    screencapture.location = "~/Pictures";
  };

  # Enable touch id authorisation for sudo
  security.pam.services.sudo_local.touchIdAuth = true;
}
