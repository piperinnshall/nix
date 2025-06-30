{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs;
    [
      firefox-unwrapped
      inputs.zen-browser.packages.${pkgs.system}.default
    ];
}
