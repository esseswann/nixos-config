{
  pkgs,
  inputs,
  var,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./system
    ./wm
  ];

  services.xserver.xkb.layout = "us,ru"; # FIXME needs extra action in Gnome settings for some reason
  services.printing.enable = true;

  programs.git = {
    enable = true;
    config = {
      user.name = var.user;
      user.email = "a.lebedev@itcanfly.org";
    };
  };

  environment.systemPackages = with pkgs; [
    vscode
    vim
    thunderbird
    telegram-desktop
    inputs.yandex-browser.packages.x86_64-linux.yandex-browser-stable
    wine64
    qbittorrent
    vlc
    python3
    gparted
    nil
    pkgs.nixfmt-rfc-style
    nautilus
  ];

  system.stateVersion = "25.05";
}
