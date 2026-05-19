{ inputs, ... }:

{
  systemd.services.tg-ws-proxy = {
    description = "Telegram WebSocket Proxy";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${inputs.tg-ws-proxy.packages.x86_64-linux.default}/bin/tg-ws-proxy";
      Restart = "always";
    };
  };
}
