{ pkgs, ... }:
{
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      (pkgs.stdenv.mkDerivation {
        name = "GOST-B";
        src = ./gost-b.ttf;
        phases = [ "installPhase" ];
        installPhase = ''
          mkdir -p $out/share/fonts/truetype
          cp $src $out/share/fonts/truetype/GOST-B.ttf
        '';
      })
    ];
  };
}
