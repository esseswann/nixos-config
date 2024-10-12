{

  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];

  users.users.jsus = {
    isNormalUser = true;
    description = "jsus";
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
