{ config, lib, pkgs, home-manager, ... }:

{
  imports =
    [
      home-manager.nixosModules.default
      ../../applications/anki.nix
      ../../applications/librewolf.nix
      ../../applications/term.nix
      ../../applications/file-utils.nix
      ../../applications/syncthing.nix

      ../../modules/general/en-locale.nix
      ../../modules/general/users.nix
      ../../modules/desktop/hyprland
      ../../modules/fonts
      ../../modules/emacs

      ../../modules/platform/laptop.nix
      ./hardware-configuration.nix
    ];



  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = lib.mkDefault "Asia/Novosibirsk";

  networking.hostName = "natsu";
  networking.networkmanager.enable = true;

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };

  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";
  services.xserver.windowManager.windowmaker.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };


  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    windowmaker
    stalonetray
    git
    gh
    cifs-utils
    vscodium
    nekoray
    chromium
    nixpkgs-fmt
    spotify
    syncthing
    gocryptfs
    pavucontrol
    gnome-pomodoro
    python312
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.ru_RU
    brillo
  ];


  home-manager.users.kano = { pkgs, ... }: {
    home.packages = with pkgs; [
      tmux
      #fbterm
      #fbv
      zsh
    ];
    programs.bash.enable = true;
    home.stateVersion = "24.05";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
