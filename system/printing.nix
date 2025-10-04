{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = [ pkgs.epson-escpr ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
