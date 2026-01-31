{ lib, pkgs, ... }:
{

  services = {
    xserver.desktopManager.gnome.enable = true;
    gnome = {
      rygel.enable = false;
      core-apps.enable = false;
    };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.hide-top-bar
    gnomeExtensions.clipboard-history
    gnome-network-displays
  ];

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        lockAll = true;
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            enable-hot-corners = false;
            show-battery-percentage = true;
          };

          "org/gnome/desktop/input-sources" = {
            per-window = false;
            xkb-options = [ "grp:caps_toggle" ];
          };

          "org/gnome/settings-daemon/plugins/color" = {
            night-light-enabled = true;
            night-light-temperature = (lib.gvariant.mkInt32 "3000");
            night-light-schedule-automatic = true;
          };

          "org/gnome/shell" = {
            disable-user-extensions = false;
            favorite-apps = [
              "yandex-browser.desktop"
              "org.telegram.desktop.desktop"
              "code.desktop"
              "thunderbird.desktop"
              "Alacritty.desktop"
            ];
            enabled-extensions = [
              pkgs.gnomeExtensions.hide-top-bar.extensionUuid
              pkgs.gnomeExtensions.clipboard-history.extensionUuid
            ];
          };
        };
      }
    ];
  };
}
