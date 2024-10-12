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
}
