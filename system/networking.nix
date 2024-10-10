{
  networking = {
    hostName = "blackbox";
    networkmanager.enable = true;
    extraHosts = ''
      127.0.0.1 zifer.site
    '';

    firewall = {
      enable = false;
      allowedTCPPorts = [ 80 443 ];
      allowedUDPPortRanges = [];
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