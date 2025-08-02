{ var, ... }:
{

  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];

  users.users.${var.user} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "media"
      "wheel"
      "audio"
      "video"
      "input"
      "libvirtd"
      "docker"
    ];
  };

  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };
  services.fprintd.enable = true;
}
