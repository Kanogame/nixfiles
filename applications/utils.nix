{
  home-manager.users.kano = { pkgs, ... }: {
    programs.git = {
      enable = true;
      userName = "kanogame";
      userEmail = "wasdqert1222@gmail.com";
      aliases = {
        ci = "commit";
        df = "diff";
      };
    };
  };
}
