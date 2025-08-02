{ var, pkgs, ... }:

let
  # Define the Alacritty config as a Nix string → turned into a file
  filename = "alacritty.toml";
  alacrittyConfig = pkgs.writeText filename ''
    # Window settings
    [window]
    decorations = "none"
    startup_mode = "Maximized"

    # Padding
    [window.padding]
    x = 24
    y = 24

    # Font settings
    [font]
    size = 12.0

    [font.normal]
    family = "Fira Code"
    style = "Regular"

    # Example color scheme (dark)
    [colors.primary]
    background = "#000000"
    foreground = "#cccccc"

    # Optional: cursor style
    [cursor]
    style = "Beam"
  '';
in
{
  system.activationScripts.alacritty = {
    text = ''
      # Create config directory for user
      mkdir -p /home/${var.user}/.config/alacritty

      # Copy the Nix-built config file
      cp ${alacrittyConfig} /home/${var.user}/.config/alacritty/${filename}

      # Fix ownership (important!)
      chown -R ${var.user}:users /home/${var.user}/.config/alacritty
    '';
  };
  programs.fish.enable = true;

  users.users.${var.user} = {
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [ alacritty ];
}
