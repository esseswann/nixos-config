{ pkgs, ... }:
{
  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
    udev.extraRules = ''
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="049f", ATTRS{idProduct}=="505e", MODE="0666"
    '';
  };

  environment.systemPackages = with pkgs; [
    usbutils
    udiskie
    udisks
  ];
}
