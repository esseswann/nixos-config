{ pkgs, lib, ... }:
{

  services = {
    xserver.desktopManager.gnome.enable = true;
    gnome = {
      rygel.enable = false;
      core-utilities.enable = false;
    };
  };

  environment.systemPackages = with pkgs; [ gnome.nautilus ];

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

          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Super>Return";
            command = "alacritty";
            name = "open-terminal";
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
              "clipboard-history@alexsaveau.dev"
              "hide-top-bar@tuxor1337"
            ];
          };
        };
      }
    ];
  };
}
