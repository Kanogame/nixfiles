{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    liberation_ttf
    jetbrains-mono
    noto-fonts-cjk-sans
    noto-fonts
    pkgs.nerd-fonts.fira-mono
  ];
}
