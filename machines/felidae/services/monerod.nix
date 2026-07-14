let
  rrpc-port = 18089;
  anon-inbound-port = 18084;
  tor-proxy-port = 9050;
  monero-env = "services/monero/env";
  ts = builtins.toString;
in
{ config, ... }:
{
  services.monero = {
    enable = true;
    environmentFile = config.sops.secrets.${monero-env}.path;
    mining.enable = false;
    dataDir = "/var/lib/monero";
    rpc = {
      restricted = true;
      address = "127.0.0.1";
    };
    banlist = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/Boog900/monero-ban-list/d8315aacc6456f9247b84cbbcafa9aa5ee030821/ban_list.txt";
      sha256 = "01z4wm2mp4z1wq2wdkrm66j50gwk3r82m2ml4n0pwjcbajxkdc87";
    };
    extraConfig = ''
      no-zmq=1
      no-igd=1
      hide-my-port=1

      public-node=1

      proxy=127.0.0.1:${ts tor-proxy-port}
      tx-proxy=tor,127.0.0.1:${ts tor-proxy-port}
      anonymous-inbound=$P2P_ONION:${ts anon-inbound-port},127.0.0.1:${ts anon-inbound-port}
      rpc-restricted-bind-port=${ts rrpc-port}

      enable-dns-blocklist=1
    '';
  };

  services.tor = {
    relay.onionServices = {
      xmr-p2p = {
        version = 3;
        map = [
          {
            port = anon-inbound-port;
            target = {
              addr = "127.0.0.1";
              port = anon-inbound-port;
            };
          }
        ];
      };
      xmr-rrpc = {
        version = 3;
        map = [
          {
            port = rrpc-port;
            target = {
              addr = "127.0.0.1";
              port = rrpc-port;
            };
          }
        ];
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    rrpc-port
    anon-inbound-port
  ];
  networking.firewall.allowedUDPPorts = [
    rrpc-port
    anon-inbound-port
  ];

  sops.secrets.${monero-env} = {
    owner = "monero";
    group = "monero";
  };
}
