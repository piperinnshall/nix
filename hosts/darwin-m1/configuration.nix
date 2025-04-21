{
  pkgs,
  self,
  ...
}:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.settings.trusted-users =
    [
      "piperinnshall"
    ];

  programs.fish.enable = true;
  environment.variables.SHELL = "${pkgs.fish}/bin/fish";

  nixpkgs.config.allowUnfree = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
