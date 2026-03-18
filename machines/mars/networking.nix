{ lib, pkgs, ... }:
{
  networking.hostName = "mars";
  networking.hostId = "f00fdeed";

  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
      networkmanager-openvpn
      # networkmanager-fortisslvpn
    ];
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp170s0.useDHCP = lib.mkDefault true;

  services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # causes trouble sometimes and is read-only so it's annoying to patch
  # networking.stevenblack.enable = true;

  services.vnstat.enable = true;

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
}
