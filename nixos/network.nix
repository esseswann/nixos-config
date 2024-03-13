{
  networking = {
    hostName = "blackbox";
    networkmanager.enable = true;
    extraHosts = ''
      127.0.0.1 zifer.site
    '';
    # wireless.networks = {
    #   enable = true;
    #   ziferblat = { psk = "allyouneedislove"; };
    #   tool = { psk = "lateralus"; };
    # };
  };
}
