{ ... }:
{
  imports = [
    ./wm
    ./system
    ./programs
    ./hardware-configuration.nix
  ];

  services.xserver.xkb.layout = "us,ru"; # FIXME needs extra action in Gnome settings for some reason

  system.stateVersion = "25.05";

}
