{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system
      ./wm
    ];

  services.xserver.xkb.layout = "us,ru"; ## FIXME
  services.printing.enable = true;
  # programs.firefox.enable = true;

  programs.fish.enable = true;
  programs.git = {
    enable = true;
    # FIXME
    # userName  = "jsus";
    # userEmail = "a.lebedev@itcanfly.org";
  };

  environment.systemPackages = with pkgs; [
    vscode
    vim
    thunderbird
    telegram-desktop
    inputs.yandex-browser.packages.x86_64-linux.yandex-browser-stable
    wine64
    qbittorrent
    alacritty
  ];

  system.stateVersion = "24.05";
}
