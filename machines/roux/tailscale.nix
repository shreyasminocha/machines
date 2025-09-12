{
  config,
  pkgs,
  ...
}:
let
  auth-key = "tailscale/auth-key";
in
{
  services.tailscale = {
    enable = true;
    authKeyFile = config.sops.secrets.${auth-key}.path;
    useRoutingFeatures = "server";
    extraUpFlags = [ "--advertise-exit-node" ];
    permitCertUid = "caddy";
  };

  networking.firewall.allowedUDPPorts = [ config.services.tailscale.port ];
  networking.firewall.trustedInterfaces = [ "tailscale0" ];

  environment.systemPackages = with pkgs; [ tailscale ];

  sops.secrets.${auth-key} = { };
}
