{
  pkgs,
  ...
}:
{
  # Build darwin flake using:
  # $ darwin-rebuild build --flake .#Pipers-MacBook-Pro

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  # Necessary for using flakes on this system.
  nix.settings = {
    experimental-features = "nix-command flakes";
  };

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # In the long run, this setting will be deprecated
  system.primaryUser = "piperinnshall";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;

  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false;
    dock.show-recents = false;
    NSGlobalDomain._HIHideMenuBar = true;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.LoginwindowText = "Nix Darwin";
    screencapture.location = "~/Pictures";
  };

  # Enable touch id authorisation for sudo
  security.pam.services.sudo_local.touchIdAuth = true;
}
