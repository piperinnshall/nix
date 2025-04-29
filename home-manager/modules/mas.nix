{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    mas
  ];

  home.activation.installMasApps = lib.hm.dag.entryAfter ["installPackages"] ''

    ${pkgs.mas}/bin/mas install 1552826194 || echo "iWallpaper failed"

    # ${pkgs.mas}/bin/mas install APPID || echo "App failed"
  '';
}
