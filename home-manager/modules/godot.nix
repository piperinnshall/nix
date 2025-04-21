{
  pkgs,
  ...
}:
let
  godotVersion = "4.4.1-stable";
  godotHash = "sha256-bGcFltIa+3kXxznQuFsQtKxqRAUf+ipnL5C8faUGKGQ=";
in
{
  home.packages =
    [
      (pkgs.stdenv.mkDerivation {
        pname = "godot";
        version = godotVersion;
        src = pkgs.fetchurl {
          url = "https://github.com/godotengine/godot/releases/download/${godotVersion}/Godot_v${godotVersion}_macos.universal.zip";
          sha256 = godotHash;
        };
        sourceRoot = ".";
        nativeBuildInputs =
          [
            pkgs.unzip
          ];
        installPhase = ''
mkdir -p $out/Applications $out/bin
cp -r Godot.app $out/Applications/
ln -s $out/Applications/Godot.app/Contents/MacOS/Godot $out/bin/godot
        '';
        meta = {
          platforms =
            [
              "aarch64-darwin"
              "x86_64-darwin"
            ];
        };
      })
    ];
}
