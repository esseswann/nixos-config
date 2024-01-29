{ inputs, lib, pkgs, ... }: {
  home = {
    homeDirectory = "/home/jsus";
    packages = with pkgs; [
      docker-compose
      freshfetch
      grc
      inputs.yandex-browser.packages.x86_64-linux.yandex-browser-stable
      jq
      killall
      ripgrep
      telegram-desktop
      thunderbird
      vscode
    ];
    sessionVariables = { EDITOR = "vim"; };
    stateVersion = "23.11";
    username = "jsus";
  };

  imports = lib.concatMap import [ ./programs ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [ "electron-25.9.0" ];
    };
  };

  systemd.user.startServices = "sd-switch";
}
