{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    raycast
    vlc-bin
    zathura
    discord
    ninja
    xld
    flac
  ];
}
# killall XLD 2>/dev/null
# defaults delete jp.tmkk.XLD
# rm -rf ~/Library/Saved\ Application\ State/jp.tmkk.XLD.savedState
# rm -rf ~/Library/Preferences/jp.tmkk.XLD.plist
# rm -rf ~/Library/Application\ Support/XLD
