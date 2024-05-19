{ inputs, lib, config, pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_6_9;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
      };
      systemd-boot.enable = false;
    };
  };

  environment = {
    etc = lib.mapAttrs' (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    }) config.nix.registry;
    systemPackages = with pkgs; [ vim git nil nixfmt ];
  };

  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [ fira-code fira-code-symbols ];
  };

  hardware = {
    # opengl = {
    #   enable = true;
    #   driSupport = true;
    #   extraPackages = with pkgs; [
    #     intel-media-driver
    #     vaapiIntel
    #     vaapiVdpau
    #     libvdpau-va-gl
    #     pkgs.mesa.drivers
    #   ];
    # };
    pulseaudio.enable = false;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  imports = [ ./network.nix ./hardware-configuration.nix ];

  nix = {
    nixPath = [ "/etc/nix/path" ];
    registry = (lib.mapAttrs (_: flake: { inherit flake; }))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
    };
  };

  nixpkgs = { config = { allowUnfree = true; }; };

  programs = {
    sway.enable = true;
    fish = {
      enable = true;
      promptInit = ''
        ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
      '';
    };
  };

  security = {
    rtkit.enable = true;
    tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };
  };

  services = {
    pipewire = {
      alsa = {
        enable = true;
        support32Bit = true;
      };
      enable = true;
      pulse.enable = true;
    };
    printing.enable = true;
    xserver = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      enable = true;
      xkb = { layout = "us,ru"; };
    };
  };

  system.stateVersion = "24.05";

  time.timeZone = "Europe/Moscow";

  users = {
    mutableUsers = true;
    users = {
      jsus = {
        extraGroups = [ "wheel" "docker" "networkmanager" "tss" ];
        isNormalUser = true;
        shell = pkgs.fish;
      };
    };
  };

  virtualisation.docker = { enable = true; };

}
