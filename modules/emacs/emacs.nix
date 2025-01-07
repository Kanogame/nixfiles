{ self, pkgs, ... }: {
  services.emacs.enable = true;

  home-manager.users.kano = { pkgs, ... }: {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs; # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
      extraPackages = epkgs: with epkgs; [
        dracula-theme

        #org
        org
        org-roam
        emacsql
        emacsql-sqlite

        evil
      ];
      extraConfig = builtins.readFile ./config.el;
    };
  };
}
