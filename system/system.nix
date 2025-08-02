{ var, ... }:
{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  hardware.graphics.enable = true;

  ## For dualboot Windows
  time.hardwareClockInLocalTime = true;

  fileSystems."/boot" = {
    ## Boot from Windows created boot partition
    device = "/dev/disk/by-label/SYSTEM";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-label/home";
    fsType = "ext4";
  };

  fileSystems."/home/${var.user}/share" = {
    device = "/dev/disk/by-label/SHARE";
    fsType = "ntfs";
    options = [
      "users"
      "nofail"
    ];
  };
}
