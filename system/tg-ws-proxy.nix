{ inputs, ... }:

let
  secret = "6861726420746F206265206120676F64";
in

# The secret is a connection authentication key, not a message decryption key.
# Telegram messages remain encrypted end-to-end. The proxy only forwards encrypted
# packets and cannot read message content. The secret proves you're allowed to
# use this proxy server.

# Check url in journalctl -u tg-ws-proxy -n 20

{
  systemd.services.tg-ws-proxy = {
    description = "Telegram WebSocket Proxy";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${inputs.tg-ws-proxy.packages.x86_64-linux.default}/bin/tg-ws-proxy --secret ${secret}";
      Restart = "always";
    };
  };
}
