{
  services.caddy.virtualHosts."mirrors.shr.cx" = {
    extraConfig = ''
      root * /archive/mirrors
      file_server { browse }
    '';
  };

  systemd.services."sync-arch-mirror" = {
    script = "/home/shreyas/syncarch.sh";
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    # startAt = "*:0/5";
    startAt = "daily";
  };
}
