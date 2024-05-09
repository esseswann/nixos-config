{ pkgs, ... }: {

  home.packages = with pkgs.gnomeExtensions;
    [
      # appindicator
      clipboard-history
      # hide-top-bar
      # dash-to-panel
      # primary-input-on-lockscreen
      # vitals
    ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
    };

    "org/gnome/desktop/input-sources" = {
      per-window = false;
      xkb-options = [ "grp:caps_toggle" ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super><Shift>q" ];
      # switch-to-workspace-1 = [ "<Super>1" ];
      # switch-to-workspace-2 = [ "<Super>2" ];
      # switch-to-workspace-3 = [ "<Super>3" ];
      # switch-to-workspace-4 = [ "<Super>4" ];
      # switch-to-workspace-5 = [ "<Super>5" ];
      # switch-to-workspace-6 = [ "<Super>6" ];
      # switch-to-workspace-7 = [ "<Super>7" ];
      toggle-maximized = [ "<Super>f" ];
    };

    "org/gnome/desktop/wm/preferences" = { num-workspaces = 7; };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" =
      {
        binding = "<Super>Return";
        command = "alacritty";
        name = "open-terminal";
      };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-temperature = 3000;
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
        # "appindicatorsupport@rgcjonas.gmail.com"
        "clipboard-history@alexsaveau.dev"
        # "hidetopbar@mathieu.bidon.ca" # does not work right now
        # "dash-to-panel@jderose9.github.com"
        # "Vitals@CoreCodingom"
        # "primary_input_on_lockscreen@sagidayan.com"
      ];
    };

    # "org/gnome/shell/app-switcher" = { current-workspace-only = true; };

    # "org/gnome/shell/keybindings" = {
    #   switch-to-application-1 = [ ];
    #   switch-to-application-2 = [ ];
    #   switch-to-application-3 = [ ];
    #   switch-to-application-4 = [ ];
    #   switch-to-application-5 = [ ];
    #   switch-to-application-6 = [ ];
    #   switch-to-application-7 = [ ];
    # };
  };
}
