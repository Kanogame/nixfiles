# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, home-manager, ... }:

{
  imports =
    [
      home-manager.nixosModules.default
      ../../applications/anki.nix
      ../../applications/librewolf.nix
      ../../applications/term.nix
      ../../modules/fonts/fonts.nix

      ./hardware-configuration.nix
    ];



  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
  };
  time.timeZone = lib.mkDefault "Asia/Novosibirsk";

  networking.hostName = "pc";
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";
  services.xserver.windowManager.windowmaker.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };


  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kano = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
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
    fcitx5
    libsForQt5.fcitx5-configtool
    fcitx5-mozc
    vscodium
    nixpkgs-fmt
  ];

  home-manager.users.kano = { pkgs, ... }: {
    home.packages = with pkgs; [
      tmux
      fbterm
      fbv
      zsh
    ];
    programs.bash.enable = true;
    home.stateVersion = "24.11";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11"; # Did you read the comment?
}

