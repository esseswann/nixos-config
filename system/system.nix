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

  fileSystems."/home/${var.user}/share" = {
    device = "/dev/disk/by-label/SHARE";
    fsType = "ntfs";
    options = [
      "users"
      "nofail"
    ];
  };

  hardware.opengl.enable = true;

  ## For dualboot Windows
  time.hardwareClockInLocalTime = true;
}
