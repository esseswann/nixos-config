{ inputs, ... }:

let
  secrets = import ../secrets.nix;
in
{
  systemd.services.tg-ws-proxy = {
    description = "Telegram WebSocket Proxy";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${inputs.tg-ws-proxy.packages.x86_64-linux.default}/bin/tg-ws-proxy --secret ${secrets.TG_WS_PROXY_SECRET}";
      Restart = "always";
    };
  };
}
