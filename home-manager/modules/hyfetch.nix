{
  pkgs,
  ...
}:
{
  home.packages = with pkgs;
    [
      hyfetch
    ];

  xdg.configFile."hyfetch.json".text = ''
{
    "preset": "transgender",
    "mode": "rgb",
    "light_dark": "light",
    "lightness": 1.0,
    "color_align": {
        "mode": "horizontal",
        "custom_colors": [],
        "fore_back": null
    },
    "backend": "neofetch",
    "args": null,
    "distro": null,
    "pride_month_shown": [],
    "pride_month_disable": false
}
  '';
}
