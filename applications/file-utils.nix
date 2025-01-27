{
  home-manager.users.kano = { pkgs, ... }: {
    home.packages = with pkgs; [
      xfce.thunar
      xfce.thunar-archive-plugin
      zip
      unzip
     ];
  };
}
