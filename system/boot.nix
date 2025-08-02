{ pkgs, ... }:
{

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [
      "quiet"
      "udev.log_level=0"
    ];

    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    initrd.verbose = false;
    consoleLogLevel = 0;
  };
}
