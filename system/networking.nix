{
  networking = {
    hostName = "blackbox";
    networkmanager.enable = true;

    extraHosts = ''
      127.0.0.1 zifer.site
    '';

    # networkmanager.dns = "none";

    # nameservers = [
    #   "77.88.8.8" # Yandex
    #   "77.88.8.1" # Yandex
    #   "8.8.8.8" # Google
    #   "1.1.1.1" # Google
    # ];

    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        443
      ];
      allowedUDPPortRanges = [ ];
    };

    # FIXME
    # wireless.networks = {
    #   enable = true;
    #   ziferblat = { psk = "allyouneedislove"; };
    #   tool = { psk = "lateralus"; };
    # };
  };

  hardware.bluetooth.enable = true;
}
