{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./vscode
    ./alacritty
    ./git.nix
    ./docker.nix
  ];

  environment.systemPackages = with pkgs; [
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
}
