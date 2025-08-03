{ pkgs, var, ... }:
let
  filename = "settings.json";
  path = "${var.dotConfig}/Code/User";
  settings = pkgs.writeText filename (builtins.readFile ./${filename});
  # extensions = import ./extensions.nix { inherit pkgs; };
in
{
  system.activationScripts.vscode = {
    text = ''
      mkdir -p ${path}

      cp ${settings} ${path}/${filename}

      chown -R ${var.user}:users ${path}

      rm ${path}/${filename}

      ln -s /etc/nixos/programs/vscode/${filename} ${path}/${filename}
    '';
  };

  environment.systemPackages = with pkgs; [
    vscode
  ];
  # ++ extensions;
}
