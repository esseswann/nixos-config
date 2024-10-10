{ pkgs, ... }:{

  imports = [
    ./gdm.nix
    ./gnome.nix
  ];

  services = {
    dbus.enable = true;
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
    };
  };

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
