{
  networking = {
    hostName = "nixos-jhh";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 111 1514 2049 3000 3100 5555 8081 8082 ];
    };
    networkmanager.enable = true;
    useDHCP = false;
  };
}
