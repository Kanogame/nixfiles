{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    liberation_ttf
    jetbrains-mono
    noto-fonts-cjk
    noto-fonts
    (nerdfonts.override { fonts = [ "FiraMono" ]; })
  ];
}
