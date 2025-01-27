{
  services = {
    syncthing = {
      enable = false;
    };
  };

  # WARNING, opening ports
  networking.firewall.allowedTCPPorts = [ 33109 ];
  networking.firewall.allowedUDPPorts = [ 33109 21027 ];
}
