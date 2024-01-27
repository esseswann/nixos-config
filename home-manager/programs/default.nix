let
  more = { pkgs, ... }: {
    programs = {
      home-manager.enable = true;
      jq.enable = true;
      htop.enable = true;
      brave.enable = true;
      git = {
        enable = true;
        userName = "jsus";
        userEmail = "a.lebedev@itcanfly.org";
      };
    };
  };
in [ ./alacritty ./fish ./gnome ./nixvim more ]
